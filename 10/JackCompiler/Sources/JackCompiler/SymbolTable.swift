enum Kind : String {
    case `var`, argument, `static`, field, `class`, subroutine
}

struct Symbol : Hashable, CustomStringConvertible {
    let name: String
    let type: String
    let kind: Kind
    let index: Int

    init(withName name: String, type: String, kind: Kind) {
        self.name = name
        self.type = type
        self.kind = kind
        self.index = -1
    }

    fileprivate init(withSymbol symbol: Symbol, index: Int) {
        self.name = symbol.name
        self.type = symbol.type
        self.kind = symbol.kind
        self.index = index
    }

    static func ==(lhs: Symbol, rhs: Symbol) -> Bool {
        return lhs.name == rhs.name && lhs.type == rhs.type && lhs.kind == rhs.kind
    }

    var hashValue: Int {
        return self.name.hashValue ^ self.type.hashValue ^ self.kind.hashValue
    }

    var description: String {
        return "\(name) \(type) \(kind.rawValue) \(index)"
    }

    fileprivate func isClassSymbol() -> Bool {
        switch self.kind {
        case .static, .field, .class:
            return true
        default:
            return false
        }
    }

    fileprivate static func symbolName(from tokenType: TokenType) -> String {
        switch tokenType {
        case let .identifier(s):
            return s
        default:
            fatalError("Unexpected token for symbol name : \(tokenType). Expected identifier")
        }
    }

    fileprivate static func symbolType(from tokenType: TokenType) -> String {
        switch tokenType {
        case let .keyword(k):
            return k.rawValue
        case let .identifier(s):
            return s
        default:
            fatalError("Unexpected token for symbol type : \(tokenType). Expected keyword or identifier")
        }
    }

    fileprivate static func symbolKind(from tokenType: TokenType) -> Kind {
        switch tokenType {
        case .keyword(.static):
            return .static
        case .keyword(.field):
            return .field
        default:
            fatalError("Unexpected token for symbol kind : \(tokenType). Expected static or field keyword")
        }
    }
}

class SymbolTable {
    static var classTable: [String : Symbol] = [:]
    static var methodTable: [String : Symbol] = [:]

    static func addSymbol(withName name: TokenType, type: TokenType, kind: TokenType) {
        let symbolName = Symbol.symbolName(from: name)
        let symbolType = Symbol.symbolType(from: type)
        let symbolKind = Symbol.symbolKind(from: kind)
        let symbol = Symbol(withName: symbolName, type: symbolType, kind: symbolKind)
        SymbolTable.addSymbolInternal(symbol: symbol)
    }

    static func addSymbol(withName name: TokenType, type: TokenType, kind: Kind) {
        let symbolName = Symbol.symbolName(from: name)
        let symbolType = Symbol.symbolType(from: type)
        let symbol = Symbol(withName: symbolName, type: symbolType, kind: kind)
        SymbolTable.addSymbolInternal(symbol: symbol)
    }

    private static func addSymbolInternal(symbol: Symbol) {
        if symbol.isClassSymbol() {
            SymbolTable.addClassSymbol(symbol: symbol)
        } else {
            SymbolTable.addMethodSymbol(symbol: symbol)
        }
    }

    private static func addClassSymbol(symbol: Symbol) {
        let kind: Kind = symbol.kind
        let kindCount: Int = classTable.filter { $0.value.kind == kind }.count
        classTable[symbol.name] = Symbol(withSymbol: symbol, index: kindCount)
    }

    private static func addMethodSymbol(symbol: Symbol) {
        let kind: Kind = symbol.kind
        let kindCount: Int = methodTable.filter { $0.value.kind == kind }.count
        methodTable[symbol.name] = Symbol(withSymbol: symbol, index: kindCount)
    }

    static func resetSymbols() {
        classTable.removeAll()
        SymbolTable.resetMethodSymbols()
    }

    static func resetMethodSymbols() {
        methodTable.removeAll()
    }
}
