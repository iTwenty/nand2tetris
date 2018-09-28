import Foundation

enum JackParserError: Error, CustomStringConvertible {
    case missingToken(expectedTokens: Set<TokenType>)
    case unexpectedToken(token: TokenType, expectedTokens: Set<TokenType>)

    var description: String {
        switch self {
        case let .missingToken(expectedTokens):
            return "Token not found : expected one of \(expectedTokens)"
        case let .unexpectedToken(token, expectedTokens):
            return "Unexpected token : \(token), expected one of \(expectedTokens)"
        }
    }
}

/**
 Parser for Jack language. The grammar this parser validates against can be found on slides 15 and 16 of this document:
 https://docs.wixstatic.com/ugd/44046b_aca87ffea29e416f8c0d7e9edbd6b273.pdf
 */
class JackParser {

    private static let typeTokens: Set<TokenType> = [.keyword(.int), .keyword(.char), .keyword(.boolean), .identifier("")]

    private static let termTokens: Set<TokenType> = [.intConstant(0), .stringConstant(""), .keyword(.true), .keyword(.false),
                                                     .keyword(.null), .keyword(.this), .identifier(""), .symbol("(" as Character),
                                                     .symbol("-" as Character), .symbol("~" as Character)]

    private static let opTokens: Set<TokenType> = [.symbol("+"), .symbol("-"), .symbol("*"), .symbol("/"), .symbol("&"),
                                                   .symbol("|"), .symbol("<"), .symbol(">"), .symbol("="), ]

    private static var tokenIterator: PeekingIterator<[TokenType]> = [].makePeekingIterator()

    static func parseTokens(_ tokens: [TokenType]) throws -> String {
        var s: String = ""
        tokenIterator = tokens.makePeekingIterator()
        s += try parseClass()
        return s
    }

    private static func parseClass() throws -> String {
        SymbolTable.resetSymbols()
        var clazz: String = ""
        try eat(expectedTokens: [.keyword(.class)])
        try eat(expectedTokens: [.identifier("")])
        try eat(expectedTokens: [.symbol("{")])
        let expectedClassVarDecTokens: Set<TokenType> = [.keyword(.static), .keyword(.field)]
        while let peekedToken = tokenIterator.peek(), set(expectedClassVarDecTokens, contains: peekedToken) {
            clazz += try parseClassVarDec()
        }
        let expectedSubroutineDecTokens: Set<TokenType> = [.keyword(.constructor), .keyword(.function), .keyword(.method)]
        while let peekedToken = tokenIterator.peek(), set(expectedSubroutineDecTokens, contains: peekedToken) {
            clazz += try parseSubroutineDec()
        }
        try eat(expectedTokens: [.symbol("}")])
        return clazz
    }

    private static func parseClassVarDec() throws -> String {
        let classVarKind = try eat(expectedTokens: [.keyword(.static), .keyword(.field)])
        let classVarType = try eat(expectedTokens: typeTokens)
        let classVarName = try eat(expectedTokens: [.identifier("")])
        SymbolTable.addSymbol(withName: classVarName, type: classVarType, kind: classVarKind)
        while let peekedToken = tokenIterator.peek(), set([.symbol(",")], contains: peekedToken) {
            try eat(expectedTokens: [.symbol(",")])
            let classVarName = try eat(expectedTokens: [.identifier("")])
            SymbolTable.addSymbol(withName: classVarName, type: classVarType, kind: classVarKind)
        }
        try eat(expectedTokens: [.symbol(";")])
        return ""
    }

    private static func parseSubroutineDec() throws -> String {
        SymbolTable.resetMethodSymbols()
        var subroutineDec = ""
        try eat(expectedTokens: [.keyword(.constructor), .keyword(.function), .keyword(.method)])
        try eat(expectedTokens: typeTokens.union([.keyword(.void)]))
        try eat(expectedTokens: [.identifier("")])
        try eat(expectedTokens: [.symbol("(")])
        subroutineDec += try parseParameterList()
        try eat(expectedTokens: [.symbol(")")])
        subroutineDec += try parseSubroutineBody()
        return subroutineDec
    }

    private static func parseParameterList() throws -> String {
        if let peekedToken = tokenIterator.peek(), set(typeTokens, contains: peekedToken) {
            let argumentType = try eat(expectedTokens: typeTokens)
            let argumentName = try eat(expectedTokens: [.identifier("")])
            SymbolTable.addSymbol(withName: argumentName, type: argumentType, kind: .argument)
            while let peekedToken = tokenIterator.peek(), set([.symbol(",")], contains: peekedToken) {
                try eat(expectedTokens: [.symbol(",")])
                let argumentType = try eat(expectedTokens: typeTokens)
                let argumentName = try eat(expectedTokens: [.identifier("")])
                SymbolTable.addSymbol(withName: argumentName, type: argumentType, kind: .argument)
            }
        }
        return ""
    }

    private static func parseSubroutineBody() throws -> String {
        var subroutineBody = ""
        try eat(expectedTokens: [.symbol("{")])
        while let peekedToken = tokenIterator.peek(), set([.keyword(.var)], contains: peekedToken) {
            subroutineBody += try parseVarDec()
        }
        subroutineBody += try parseStmts()
        try eat(expectedTokens: [.symbol("}")])
        return subroutineBody
    }

    private static func parseVarDec() throws -> String {
        try eat(expectedTokens: [.keyword(.var)])
        let varType = try eat(expectedTokens: typeTokens)
        let varName = try eat(expectedTokens: [.identifier("")])
        SymbolTable.addSymbol(withName: varName, type: varType, kind: .var)
        while let peekedToken = tokenIterator.peek(), set([.symbol(",")], contains: peekedToken) {
            try eat(expectedTokens: [.symbol(",")])
            let varName = try eat(expectedTokens: [.identifier("")])
            SymbolTable.addSymbol(withName: varName, type: varType, kind: .var)
        }
        try eat(expectedTokens: [.symbol(";")])
        return ""
    }

    private static func parseStmts() throws -> String {
        var stmts = ""
        let expectedStmtTokens: Set<TokenType> = [.keyword(.if), .keyword(.let), .keyword(.while), .keyword(.do), .keyword(.return)]
        while let peekedToken = tokenIterator.peek(), set(expectedStmtTokens, contains: peekedToken) {
            switch peekedToken {
            case .keyword(.if):
                stmts += try parseIfStmt()
            case .keyword(.let):
                stmts += try parseLetStmt()
            case .keyword(.while):
                stmts += try parseWhileStmt()
            case .keyword(.do):
                stmts += try parseDoStmt()
            case .keyword(.return):
                stmts += try parseReturnStmt()
            default:
                break // Will never reach here
            }
        }
        return stmts
    }

    private static func parseIfStmt() throws -> String {
        var ifStmt = ""
        try eat(expectedTokens: [.keyword(.if)])
        try eat(expectedTokens: [.symbol("(")])
        ifStmt += try parseExpression()
        try eat(expectedTokens: [.symbol(")")])
        try eat(expectedTokens: [.symbol("{")])
        ifStmt += try parseStmts()
        try eat(expectedTokens: [.symbol("}")])
        if let peekedToken = tokenIterator.peek(), set([.keyword(.else)], contains: peekedToken) {
            try eat(expectedTokens: [.keyword(.else)])
            try eat(expectedTokens: [.symbol("{")])
            ifStmt += try parseStmts()
            try eat(expectedTokens: [.symbol("}")])
        }
        return ifStmt
    }

    private static func parseLetStmt() throws -> String {
        var letStmt = ""
        try eat(expectedTokens: [.keyword(.let)])
        try eat(expectedTokens: [.identifier("")])
        if let peekedToken = tokenIterator.peek(), set([.symbol("[")], contains: peekedToken) {
            try eat(expectedTokens: [.symbol("[")])
            letStmt += try parseExpression()
            try eat(expectedTokens: [.symbol("]")])
        }
        try eat(expectedTokens: [.symbol("=")])
        letStmt += try parseExpression()
        try eat(expectedTokens: [.symbol(";")])
        return letStmt
    }

    private static func parseWhileStmt() throws -> String {
        var whileStmt = ""
        try eat(expectedTokens: [.keyword(.while)])
        try eat(expectedTokens: [.symbol("(")])
        whileStmt += try parseExpression()
        try eat(expectedTokens: [.symbol(")")])
        try eat(expectedTokens: [.symbol("{")])
        whileStmt += try parseStmts()
        try eat(expectedTokens: [.symbol("}")])
        return whileStmt
    }

    private static func parseDoStmt() throws -> String {
        var doStmt = ""
        try eat(expectedTokens: [.keyword(.do)])
        try eat(expectedTokens: [.identifier("")])
        if let peekedToken = tokenIterator.peek(), set([.symbol(".")], contains: peekedToken) {
            try eat(expectedTokens: [.symbol(".")])
            try eat(expectedTokens: [.identifier("")])
        }
        try eat(expectedTokens: [.symbol("(")])
        doStmt += try parseExpressionList()
        try eat(expectedTokens: [.symbol(")")])
        try eat(expectedTokens: [.symbol(";")])
        return doStmt
    }

    private static func parseReturnStmt() throws -> String {
        var returnStmt = ""
        try eat(expectedTokens: [.keyword(.return)])
        if let peekedToken = tokenIterator.peek(), set(termTokens, contains: peekedToken) {
            returnStmt += try parseExpression()
        }
        try eat(expectedTokens: [.symbol(";")])
        return returnStmt
    }

    private static func parseExpression() throws -> String {
        var expression = ""
        expression += try parseTerm()
        while let peekedToken = tokenIterator.peek(), set(opTokens, contains: peekedToken) {
            try eat(expectedTokens: opTokens)
            expression += try parseTerm()
        }
        return expression
    }

    private static func parseTerm() throws -> String {
        var term = ""
        let tokenToEat = try eat(expectedTokens: termTokens)
        if set([.symbol("(")], contains: tokenToEat) {
            term += try parseExpression()
            try eat(expectedTokens: [.symbol(")")])
        } else if set([.symbol("-"), .symbol("~")], contains: tokenToEat) {
            term += try parseTerm()
        } else if set([.identifier("")], contains: tokenToEat) {
            if let peekedToken = tokenIterator.peek(), set([.symbol("["), .symbol("."), .symbol("(")], contains: peekedToken) {
                switch peekedToken {
                case .symbol("["):
                    try eat(expectedTokens: [.symbol("[")])
                    term += try parseExpression()
                    try eat(expectedTokens: [.symbol("]")])
                case .symbol("."):
                    try eat(expectedTokens: [.symbol(".")])
                    try eat(expectedTokens: [.identifier("")])
                    fallthrough
                case .symbol("("):
                    try eat(expectedTokens: [.symbol("(")])
                    term += try parseExpressionList()
                    try eat(expectedTokens: [.symbol(")")])
                default:
                    break // Will never reach here
                }
            }
        }
        return term
    }

    private static func parseExpressionList() throws -> String {
        var expressionList = ""
        if let peekedToken = tokenIterator.peek(), set(termTokens, contains: peekedToken) {
            expressionList += try parseExpression()
            while let peekedToken = tokenIterator.peek(), set([.symbol(",")], contains: peekedToken) {
                try eat(expectedTokens: [.symbol(",")])
                expressionList += try parseExpression()
            }
        }
        return expressionList
    }

    @discardableResult
    private static func eat(expectedTokens: Set<TokenType>) throws -> TokenType {
        guard let currentToken = tokenIterator.next() else {
            throw JackParserError.missingToken(expectedTokens: expectedTokens)
        }

        if set(expectedTokens, contains: currentToken) {
            return currentToken
        }

        throw JackParserError.unexpectedToken(token: currentToken, expectedTokens: expectedTokens)
    }

    private static func set(_ set: Set<TokenType>, contains token: TokenType) -> Bool {
        for expectedToken in set {
            switch (token, expectedToken) {
            case (let .keyword(k1), let .keyword(k2)) where k1 == k2:
                return true
            case (let .symbol(c1), let .symbol(c2)) where c1 == c2:
                return true
            case (.identifier(_), .identifier(_)),
                 (.intConstant(_), .intConstant(_)),
                 (.stringConstant(_), .stringConstant(_)):
                return true
            default:
                continue
            }
        }

        return false
    }
}
