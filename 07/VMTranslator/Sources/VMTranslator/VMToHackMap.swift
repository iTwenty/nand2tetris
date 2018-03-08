enum Location: String {
    case local, argument, this, that

    func locationName() -> String {
        switch self {
        case .local:
            return "LCL"
        case .argument:
            return "ARG"
        case .this:
            return "THIS"
        case .that:
            return "THAT"
        }
    }
}

enum Pointer: Int {
    case this, that

    func pointerName() -> String {
        switch self {
        case .this:
            return Location.this.locationName()
        case .that:
            return Location.that.locationName()
        }
    }
}

enum TwoParamOp : String {
    case add, sub, and, or

    func operand() -> String {
        switch self {
        case .add:
            return "+"
        case .sub:
            return "-"
        case .and:
            return "&"
        case .or:
            return "|"
        }
    }
}

enum OneParamOp : String {
    case not, neg

    func operand() -> String {
        switch self {
        case .not:
            return "!"
        case .neg:
            return "-"
        }
    }
}

enum ComparisonOp : String {
    case eq, gt, lt

    func jmpCommand() -> String {
        switch self {
        case .eq:
            return "JEQ"
        case .gt:
            return "JGT"
        case .lt:
            return "JLT"
        }
    }
}

let pushConstant: (Int) -> String = { constant in
    if constant == -1 {
        return """
        // push constant \(constant)
        @SP
        A = M
        M = -1
        @SP
        M = M + 1
        // ~push constant \(constant)
        """
    } else {
        return """
        // push constant \(constant)
        @\(constant)
        D = A
        @SP
        A = M
        M = D
        @SP
        M = M + 1
        // ~push constant \(constant)
        """
    }
}

let pushAddress: (Int) -> String = { address in
    return """
    // push R\(address)
    @R\(address)
    D = M
    @SP
    A = M
    M = D
    @SP
    M = M + 1
    // ~push R\(address)
    """
}

let popAddress: (Int) -> String = { address in
    return """
    // pop R\(address)
    @SP
    M = M - 1
    A = M
    D = M
    @R\(address)
    M = D
    // ~pop R\(address)
    """
}

let pushTemp: (Int) -> String = { offset in
    return """
    // push temp \(offset)
    \(pushAddress(offset + 5))
    // ~push temp \(offset)
    """
}

let popTemp: (Int) -> String = { offset in
    return """
    // pop temp \(offset)
    \(popAddress(offset + 5))
    // ~pop temp \(offset)
    """
}

let pushLocation: (Location, Int) -> String = { location, offset in
    return """
    // push \(location.rawValue) \(offset)
    @\(offset)
    D = A
    @\(location.locationName())
    A = M + D
    D = M
    @SP
    A = M
    M = D
    @SP
    M = M + 1
    // ~push \(location.rawValue) \(offset)
    """
}

let popLocation: (Location, Int) -> String = { location, offset in
    return """
    // pop \(location.rawValue) \(offset)
    @SP
    M = M - 1
    A = M
    D = M
    @R13
    M = D
    @\(offset)
    D = A
    @\(location.locationName())
    D = D + M
    @R14
    M = D
    @R13
    D = M
    @R14
    A = M
    M = D
    // ~pop \(location.rawValue) \(offset)
    """
}

let pushStatic: (String, Int) -> String = { fileName, offset in
    return """
    // push static \(offset)
    @\(fileName).\(offset)
    D = M
    @SP
    A = M
    M = D
    @SP
    M = M + 1
    // ~push static \(offset)
    """
}

let popStatic: (String, Int) -> String = { fileName, offset in
    return """
    // pop static \(offset)
    @SP
    M = M - 1
    A = M
    D = M
    @\(fileName).\(offset)
    M = D
    // ~pop static \(offset)
    """
}

let pushPointer: (Pointer) -> String = { pointer in
    return """
    // push pointer \(pointer)
    @\(pointer.pointerName())
    D = M
    @SP
    A = M
    M = D
    @SP
    M = M + 1
    // ~push pointer \(pointer)
    """
}

let popPointer: (Pointer) -> String = { pointer in
    return """
    // pop pointer \(pointer)
    @SP
    M = M - 1
    A = M
    D = M
    @\(pointer.pointerName())
    M = D
    // ~pop pointer \(pointer)
    """
}

let twoParamOp: (TwoParamOp) -> String = { op in
    return """
    // \(op.rawValue)
    \(popAddress(13))
    \(popAddress(14))
    @R14
    D = M
    @R13
    M = D \(op.operand()) M
    \(pushAddress(13))
    // ~\(op.rawValue)
    """
}

let oneParamOp: (OneParamOp) -> String = { op in
    return """
    // \(op.rawValue)
    \(popAddress(13))
    M = \(op.operand())M
    \(pushAddress(13))
    // ~\(op.rawValue)
    """
}

var comparsionLabelCount: Int = 0

let comparisonOp: (ComparisonOp) -> String = { op in
    let retVal =  """
    // \(op.rawValue)
    \(popAddress(13))
    \(popAddress(14))
    @R14
    D = M
    @R13
    D = D - M
    @IF-\(op.rawValue.uppercased())-\(comparsionLabelCount)
    D; \(op.jmpCommand())
    \(pushConstant(0))
    @END-\(op.rawValue.uppercased())-\(comparsionLabelCount)
    0; JMP
    (IF-\(op.rawValue.uppercased())-\(comparsionLabelCount))
    \(pushConstant(-1))
    (END-\(op.rawValue.uppercased())-\(comparsionLabelCount))
    // ~\(op.rawValue)
    """

    comparsionLabelCount = comparsionLabelCount + 1

    return retVal
}
