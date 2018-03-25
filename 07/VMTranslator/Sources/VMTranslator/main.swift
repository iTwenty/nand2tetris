import Foundation

func generateAsmCode(from vmCode: [String], forFileName fileName: String) -> [String] {
    var asmCode: [String] = []
    for vmCodeLine in vmCode {
        let commentStartIndex = vmCodeLine.index(of: "/") ?? vmCodeLine.endIndex
        let trimmedLine = String(vmCodeLine[..<commentStartIndex]).trimmingCharacters(in: .whitespaces)
        guard !trimmedLine.isEmpty else {
            continue
        }

        let vmCodeLineTokens: [Substring] = trimmedLine.split(separator: " ")
        switch vmCodeLineTokens[0] {
        case "push":
            asmCode.append(pushAsmCode(from: vmCodeLineTokens, forFileName: fileName))
        case "pop":
            asmCode.append(popAsmCode(from: vmCodeLineTokens, forFileName: fileName))
        case "add", "sub", "and", "or":
            asmCode.append(twoParamOpAsmCode(from: vmCodeLineTokens[0]))
        case "neg", "not":
            asmCode.append(oneParamOpAsmCode(from: vmCodeLineTokens[0]))
        case "lt", "gt", "eq":
            asmCode.append(comparisonOpAsmCode(from: vmCodeLineTokens[0]))
        case "label":
            asmCode.append(labelAsmCode(from: vmCodeLineTokens))
        case "goto":
            asmCode.append(gotoAsmCode(from: vmCodeLineTokens))
        case "if-goto":
            asmCode.append(ifGotoAsmCode(from: vmCodeLineTokens))
        default:
            continue
        }
    }
    return asmCode
}
;
func pushAsmCode(from pushVmCodeTokens: [Substring], forFileName fileName: String) -> String {
    guard pushVmCodeTokens.count == 3 else {
        return ""
    }

    guard let constant = Int(pushVmCodeTokens[2]) else {
        return ""
    }

    let str = String.init(pushVmCodeTokens[1].lowercased())

    switch str {
    case "temp":
        return pushTemp(constant)
    case "constant":
        return pushConstant(constant)
    case "static":
        return pushStatic(fileName, constant)
    case "pointer":
        guard let pointer = Pointer(rawValue: constant) else {
            return ""
        }
        return pushPointer(pointer)
    default:
        guard let location = Location(rawValue: str) else {
            return ""
        }
        return pushLocation(location, constant)
    }
}

func popAsmCode(from popVmCodeTokens: [Substring], forFileName fileName: String) -> String {
    guard popVmCodeTokens.count == 3 else {
        return ""
    }

    guard let constant = Int(popVmCodeTokens[2]) else {
        return ""
    }

    let str = String.init(popVmCodeTokens[1].lowercased())

    switch str {
    case "temp":
        return popTemp(constant)
    case "static":
        return popStatic(fileName, constant)
    case "pointer":
        guard let pointer = Pointer(rawValue: constant) else {
            return ""
        }
        return popPointer(pointer)
    default:
        guard let location = Location(rawValue: str) else {
            return ""
        }
        return popLocation(location, constant)
    }
}

func twoParamOpAsmCode(from twoParamOpVmCodeToken: Substring) -> String {
    guard let twoParamOp1: TwoParamOp = TwoParamOp(rawValue: String.init(twoParamOpVmCodeToken)) else {
        return ""
    }
    return twoParamOp(twoParamOp1)
}

func oneParamOpAsmCode(from oneParamOpVmCodeToken: Substring) -> String {
    guard let oneParamOp1: OneParamOp = OneParamOp(rawValue: String.init(oneParamOpVmCodeToken)) else {
        return ""
    }
    return oneParamOp(oneParamOp1)
}

func comparisonOpAsmCode(from comparisonOpVmCodeToken: Substring) -> String {
    guard let comparisonOp1: ComparisonOp = ComparisonOp(rawValue: String.init(comparisonOpVmCodeToken)) else {
        return ""
    }
    return comparisonOp(comparisonOp1)
}

func labelAsmCode(from labelVmCodeTokens: [Substring]) -> String {
    guard labelVmCodeTokens.count == 2 else {
        return ""
    }

    return label(String.init(labelVmCodeTokens[1]))
}

func gotoAsmCode(from gotoVmCodeTokens: [Substring]) -> String {
    guard gotoVmCodeTokens.count == 2 else {
        return ""
    }

    return goto(String.init(gotoVmCodeTokens[1]))
}

func ifGotoAsmCode(from ifGotoVmCodeTokens: [Substring]) -> String {
    guard ifGotoVmCodeTokens.count == 2 else {
        return ""
    }

    return ifGoto(String.init(ifGotoVmCodeTokens[1]))
}

func go() -> Void {
    guard CommandLine.argc == 2 else {
        print("Usage : VMTranslator <input-file>")
        exit(1)
    }

    let vmFilePath = CommandLine.arguments[1]
    let vmFileURL = URL(fileURLWithPath: vmFilePath)
    guard FileManager.default.fileExists(atPath: vmFileURL.path) else {
        print("No such file : \(vmFileURL.path)")
        exit(2)
    }

    guard let vm = try? String(contentsOf: vmFileURL, encoding: .utf8) else {
        print("Failed to open vm file : \(vmFileURL.path)")
        exit(2)
    }

    let asmFileURL: URL = vmFileURL.deletingPathExtension().appendingPathExtension("asm")
    FileManager.default.createFile(atPath: asmFileURL.path, contents: nil, attributes: nil)
    guard let asmFileHandle = try? FileHandle(forWritingTo: asmFileURL) else {
        print("Failed to open asm file : \(asmFileURL.path)")
        exit(2)
    }

    let asmFileName = asmFileURL.deletingPathExtension().lastPathComponent

    let vmLines = vm.components(separatedBy: .newlines)
    let asmLines = generateAsmCode(from: vmLines, forFileName: asmFileName)

    asmLines.forEach { (line) in
        guard let lineData = line.data(using: .utf8) else {
            print("Failed to write asm line : \(line)")
            asmFileHandle.closeFile()
            exit(2)
        }

        asmFileHandle.write(lineData)
        asmFileHandle.write("\n".data(using: .utf8)!)
    }
    asmFileHandle.closeFile()
}

go()
