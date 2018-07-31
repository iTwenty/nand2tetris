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
        let expectedMoreVarsToken: Set<TokenType> = [.symbol(",")]
        while let peekedToken = tokenIterator.peek(), set(expectedMoreVarsToken, contains: peekedToken) {
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
        let expectedParameterListTokens: Set<TokenType> = [.keyword(.int), .keyword(.char), .keyword(.boolean), .identifier("")]
        if let peekedToken = tokenIterator.peek(), set(expectedParameterListTokens, contains: peekedToken) {
            subroutineDec += try parseParameterList()
        }
        subroutineDec += try tabs() + eat(expectedTokens: [.symbol(")")]).xml() + "\n"
        subroutineDec += try parseSubroutineBody()
        indentLevel -= 1
        subroutineDec += tabs() + "</subroutineDec>\n"
        return subroutineDec
    }

    private static func parseParameterList() throws -> String {
        var parameterList = tabs() + "<parameterList>\n"
        indentLevel += 1
        parameterList += try tabs() + eat(expectedTokens: typeTokens).xml() + "\n"
        parameterList += try tabs() + eat(expectedTokens: [.identifier("")]).xml() + "\n"
        let expectedMoreParametersToken: Set<TokenType> = [.symbol(",")]
        while let peekedToken = tokenIterator.peek(), set(expectedMoreParametersToken, contains: peekedToken) {
            parameterList += try tabs() + eat(expectedTokens: [.symbol(",")]).xml() + "\n"
            parameterList += try tabs() + eat(expectedTokens: typeTokens).xml() + "\n"
            parameterList += try tabs() + eat(expectedTokens: [.identifier("")]).xml() + "\n"
        }
        indentLevel -= 1
        parameterList += tabs() + "</parameterList>\n"
        return parameterList
    }

    private static func parseSubroutineBody() throws -> String {
        var subroutineBody = tabs() + "<subroutineBody>\n"
        indentLevel += 1
        subroutineBody += try tabs() + eat(expectedTokens: [.symbol("{")]).xml() + "\n"
        let expectedVarDecTokens: Set<TokenType> = [.keyword(.var)]
        while let peekedToken = tokenIterator.peek(), set(expectedVarDecTokens, contains: peekedToken) {
            subroutineBody += try parseVarDec()
        }
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
        let expectedMoreVarsToken: Set<TokenType> = [.symbol(",")]
        while let peekedToken = tokenIterator.peek(), set(expectedMoreVarsToken, contains: peekedToken) {
            varDec += try tabs() + eat(expectedTokens: [.symbol(",")]).xml() + "\n"
            varDec += try tabs() + eat(expectedTokens: [.identifier("")]).xml() + "\n"
        }
        varDec += try tabs() + eat(expectedTokens: [.symbol(";")]).xml() + "\n"
        indentLevel -= 1
        varDec += tabs() + "</varDec>\n"
        return varDec
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
        return String.init(repeating: "\t", count: Int(indentLevel))
    }
}
