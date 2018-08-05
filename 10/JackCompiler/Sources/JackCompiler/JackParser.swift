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

    private static let termConstants: Set<TokenType> = [.intConstant(0), .stringConstant(""), .keyword(.true), .keyword(.false),
                                                     .keyword(.null), .keyword(.this), .identifier(""), .symbol("(" as Character),
                                                     .symbol("-" as Character), .symbol("~" as Character)]

    private static let opTokens: Set<TokenType> = [.symbol("+"), .symbol("-"), .symbol("*"), .symbol("/"), .symbol("&"),
                                                   .symbol("|"), .symbol("<"), .symbol(">"), .symbol("="), ]

    private static var tokenIterator: PeekingIterator<[TokenType]> = [].makePeekingIterator()
    private static var indentLevel: UInt = 1

    static func parseTokens(_ tokens: [TokenType]) throws -> String {
        var s: String = ""
        tokenIterator = tokens.makePeekingIterator()
        indentLevel = 0
        s += try parseClass()
        return s
    }

    private static func parseClass() throws -> String {
        var clazz: String = tabs() + "<class>\n"
        indentLevel += 1
        clazz += try tabs() + eat(expectedTokens: [.keyword(.class)]).xml() + "\n"
        clazz += try tabs() + eat(expectedTokens: [.identifier("")]).xml() + "\n"
        clazz += try tabs() + eat(expectedTokens: [.symbol("{")]).xml() + "\n"
        let expectedClassVarDecTokens: Set<TokenType> = [.keyword(.static), .keyword(.field)]
        while let peekedToken = tokenIterator.peek(), set(expectedClassVarDecTokens, contains: peekedToken) {
            clazz += try parseClassVarDec()
        }
        let expectedSubroutineDecTokens: Set<TokenType> = [.keyword(.constructor), .keyword(.function), .keyword(.method)]
        while let peekedToken = tokenIterator.peek(), set(expectedSubroutineDecTokens, contains: peekedToken) {
            clazz += try parseSubroutineDec()
        }
        clazz += try tabs() + eat(expectedTokens: [.symbol("}")]).xml() + "\n"
        indentLevel -= 1
        clazz += tabs() + "</class>\n"
        return clazz
    }

    private static func parseClassVarDec() throws -> String {
        var classVarDec = tabs() + "<classVarDec>\n"
        indentLevel += 1
        classVarDec += try tabs() + eat(expectedTokens: [.keyword(.static), .keyword(.field)]).xml() + "\n"
        classVarDec += try tabs() + eat(expectedTokens: typeTokens).xml() + "\n"
        classVarDec += try tabs() + eat(expectedTokens: [.identifier("")]).xml() + "\n"
        while let peekedToken = tokenIterator.peek(), set([.symbol(",")], contains: peekedToken) {
            classVarDec += try tabs() + eat(expectedTokens: [.symbol(",")]).xml() + "\n"
            classVarDec += try tabs() + eat(expectedTokens: [.identifier("")]).xml() + "\n"
        }
        classVarDec += try tabs() + eat(expectedTokens: [.symbol(";")]).xml() + "\n"
        indentLevel -= 1
        classVarDec += tabs() + "</classVarDec>\n"
        return classVarDec
    }

    private static func parseSubroutineDec() throws -> String {
        var subroutineDec = tabs() + "<subroutineDec>\n"
        indentLevel += 1
        subroutineDec += try tabs() + eat(expectedTokens: [.keyword(.constructor), .keyword(.function), .keyword(.method)]).xml() + "\n"
        subroutineDec += try tabs() + eat(expectedTokens: typeTokens.union([.keyword(.void)])).xml() + "\n"
        subroutineDec += try tabs() + eat(expectedTokens: [.identifier("")]).xml() + "\n"
        subroutineDec += try tabs() + eat(expectedTokens: [.symbol("(")]).xml() + "\n"
        subroutineDec += try parseParameterList()
        subroutineDec += try tabs() + eat(expectedTokens: [.symbol(")")]).xml() + "\n"
        subroutineDec += try parseSubroutineBody()
        indentLevel -= 1
        subroutineDec += tabs() + "</subroutineDec>\n"
        return subroutineDec
    }

    private static func parseParameterList() throws -> String {
        var parameterList = tabs() + "<parameterList>\n"
        indentLevel += 1
        if let peekedToken = tokenIterator.peek(), set(typeTokens, contains: peekedToken) {
            parameterList += try tabs() + eat(expectedTokens: typeTokens).xml() + "\n"
            parameterList += try tabs() + eat(expectedTokens: [.identifier("")]).xml() + "\n"
            while let peekedToken = tokenIterator.peek(), set([.symbol(",")], contains: peekedToken) {
                parameterList += try tabs() + eat(expectedTokens: [.symbol(",")]).xml() + "\n"
                parameterList += try tabs() + eat(expectedTokens: typeTokens).xml() + "\n"
                parameterList += try tabs() + eat(expectedTokens: [.identifier("")]).xml() + "\n"
            }
        }
        indentLevel -= 1
        parameterList += tabs() + "</parameterList>\n"
        return parameterList
    }

    private static func parseSubroutineBody() throws -> String {
        var subroutineBody = tabs() + "<subroutineBody>\n"
        indentLevel += 1
        subroutineBody += try tabs() + eat(expectedTokens: [.symbol("{")]).xml() + "\n"
        while let peekedToken = tokenIterator.peek(), set([.keyword(.var)], contains: peekedToken) {
            subroutineBody += try parseVarDec()
        }
        subroutineBody += try parseStmts()
        subroutineBody += try tabs() + eat(expectedTokens: [.symbol("}")]).xml() + "\n"
        indentLevel -= 1
        subroutineBody += tabs() + "</subroutineBody>\n"
        return subroutineBody
    }

    private static func parseVarDec() throws -> String {
        var varDec = tabs() + "<varDec>\n"
        indentLevel += 1
        varDec += try tabs() + eat(expectedTokens: [.keyword(.var)]).xml() + "\n"
        varDec += try tabs() + eat(expectedTokens: typeTokens).xml() + "\n"
        varDec += try tabs() + eat(expectedTokens: [.identifier("")]).xml() + "\n"
        while let peekedToken = tokenIterator.peek(), set([.symbol(",")], contains: peekedToken) {
            varDec += try tabs() + eat(expectedTokens: [.symbol(",")]).xml() + "\n"
            varDec += try tabs() + eat(expectedTokens: [.identifier("")]).xml() + "\n"
        }
        varDec += try tabs() + eat(expectedTokens: [.symbol(";")]).xml() + "\n"
        indentLevel -= 1
        varDec += tabs() + "</varDec>\n"
        return varDec
    }

    private static func parseStmts() throws -> String {
        var stmts = tabs() + "<statements>\n"
        indentLevel += 1
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
        indentLevel -= 1
        stmts += tabs() + "</statements>\n"
        return stmts
    }

    private static func parseIfStmt() throws -> String {
        var ifStmt = tabs() + "<ifStatement>\n"
        indentLevel += 1
        ifStmt += try tabs() + eat(expectedTokens: [.keyword(.if)]).xml() + "\n"
        ifStmt += try tabs() + eat(expectedTokens: [.symbol("(")]).xml() + "\n"
        ifStmt += try parseExpression()
        ifStmt += try tabs() + eat(expectedTokens: [.symbol(")")]).xml() + "\n"
        ifStmt += try tabs() + eat(expectedTokens: [.symbol("{")]).xml() + "\n"
        ifStmt += try parseStmts()
        ifStmt += try tabs() + eat(expectedTokens: [.symbol("}")]).xml() + "\n"
        if let peekedToken = tokenIterator.peek(), set([.keyword(.else)], contains: peekedToken) {
            ifStmt += try tabs() + eat(expectedTokens: [.keyword(.else)]).xml() + "\n"
            ifStmt += try tabs() + eat(expectedTokens: [.symbol("{")]).xml() + "\n"
            ifStmt += try parseStmts()
            ifStmt += try tabs() + eat(expectedTokens: [.symbol("}")]).xml() + "\n"
        }
        indentLevel -= 1
        ifStmt += tabs() + "</ifStatement>\n"
        return ifStmt
    }

    private static func parseLetStmt() throws -> String {
        var letStmt = tabs() + "<letStatement>\n"
        indentLevel += 1
        letStmt += try tabs() + eat(expectedTokens: [.keyword(.let)]).xml() + "\n"
        letStmt += try tabs() + eat(expectedTokens: [.identifier("")]).xml() + "\n"
        if let peekedToken = tokenIterator.peek(), set([.symbol("[")], contains: peekedToken) {
            letStmt += try tabs() + eat(expectedTokens: [.symbol("[")]).xml() + "\n"
            letStmt += try parseExpression()
            letStmt += try tabs() + eat(expectedTokens: [.symbol("]")]).xml() + "\n"
        }
        letStmt += try tabs() + eat(expectedTokens: [.symbol("=")]).xml() + "\n"
        letStmt += try parseExpression()
        letStmt += try tabs() + eat(expectedTokens: [.symbol(";")]).xml() + "\n"
        indentLevel -= 1
        letStmt += tabs() + "</letStatement>\n"
        return letStmt
    }

    private static func parseWhileStmt() throws -> String {
        var whileStmt = tabs() + "<whileStatement>\n"
        indentLevel += 1
        whileStmt += try tabs() + eat(expectedTokens: [.keyword(.while)]).xml() + "\n"
        whileStmt += try tabs() + eat(expectedTokens: [.symbol("(")]).xml() + "\n"
        whileStmt += try parseExpression()
        whileStmt += try tabs() + eat(expectedTokens: [.symbol(")")]).xml() + "\n"
        whileStmt += try tabs() + eat(expectedTokens: [.symbol("{")]).xml() + "\n"
        whileStmt += try parseStmts()
        whileStmt += try tabs() + eat(expectedTokens: [.symbol("}")]).xml() + "\n"
        indentLevel -= 1
        whileStmt += tabs() + "</whileStatement>\n"
        return whileStmt
    }

    private static func parseDoStmt() throws -> String {
        var doStmt = tabs() + "<doStatement>\n"
        indentLevel += 1
        doStmt += try tabs() + eat(expectedTokens: [.keyword(.do)]).xml() + "\n"
        doStmt += try tabs() + eat(expectedTokens: [.identifier("")]).xml() + "\n"
        if let peekedToken = tokenIterator.peek(), set([.symbol(".")], contains: peekedToken) {
            doStmt += try tabs() + eat(expectedTokens: [.symbol(".")]).xml() + "\n"
            doStmt += try tabs() + eat(expectedTokens: [.identifier("")]).xml() + "\n"
        }
        doStmt += try tabs() + eat(expectedTokens: [.symbol("(")]).xml() + "\n"
        doStmt += try parseExpressionList()
        doStmt += try tabs() + eat(expectedTokens: [.symbol(")")]).xml() + "\n"
        doStmt += try tabs() + eat(expectedTokens: [.symbol(";")]).xml() + "\n"
        indentLevel -= 1
        doStmt += tabs() + "</doStatement>\n"
        return doStmt
    }

    private static func parseReturnStmt() throws -> String {
        var returnStmt = tabs() + "<returnStatement>\n"
        indentLevel += 1
        returnStmt += try tabs() + eat(expectedTokens: [.keyword(.return)]).xml() + "\n"
        if let peekedToken = tokenIterator.peek(), set(termConstants, contains: peekedToken) {
            returnStmt += try parseExpression()
        }
        returnStmt += try tabs() + eat(expectedTokens: [.symbol(";")]).xml() + "\n"
        indentLevel -= 1
        returnStmt += tabs() + "</returnStatement>\n"
        return returnStmt
    }

    private static func parseExpression() throws -> String {
        var expression = tabs() + "<expression>\n"
        indentLevel += 1
        expression += try parseTerm()
        while let peekedToken = tokenIterator.peek(), set(opTokens, contains: peekedToken) {
            expression += try tabs() + eat(expectedTokens: opTokens).xml() + "\n"
            expression += try parseTerm()
        }
        indentLevel -= 1
        expression += tabs() + "</expression>\n"
        return expression
    }

    private static func parseTerm() throws -> String {
        var term = tabs() + "<term>\n"
        indentLevel += 1
        term += try tabs() + eat(expectedTokens: [.identifier(""), .keyword(.this)]).xml() + "\n"
        indentLevel -= 1
        term += tabs() + "</term>\n"
        return term
    }

    private static func parseExpressionList() throws -> String {
        var expressionList = tabs() + "<expressionList>\n"
        indentLevel += 1
        if let peekedToken = tokenIterator.peek(), set(termConstants, contains: peekedToken) {
            expressionList += try parseExpression()
            while let peekedToken = tokenIterator.peek(), set([.symbol(",")], contains: peekedToken) {
                expressionList += try tabs() + eat(expectedTokens: [.symbol(",")]).xml() + "\n"
                expressionList += try parseExpression()
            }
        }
        indentLevel -= 1
        expressionList += tabs() + "</expressionList>\n"
        return expressionList
    }

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

    private static func tabs() -> String {
        return String.init(repeating: " ", count: Int(indentLevel * 2))
    }
}
