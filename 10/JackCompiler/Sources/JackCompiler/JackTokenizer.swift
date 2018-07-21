import Foundation

enum Keyword : String {
    case `class`, `method`, `function`, `constructor`, `int`, `boolean`, `char`, `void`, `var`,
    `static`, `field`, `let`, `do`, `if`, `else`, `while`, `return`, `true`, `false`, `null`, `this`
}

enum TokenType {
    case keyword(Keyword), symbol(Character), identifier(String), intConstant(Int), stringConstant(String)

    func xml() -> String {
        switch self {
        case let .keyword(k):
            return "<keyword>\(k)</keyword>"
        case let .symbol(c):
            return "<symbol>\(TokenType.xmlSafe(c))</symbol>"
        case let .identifier(i):
            return "<identifier>\(i)</identifier>"
        case let .intConstant(i):
            return "<integerConstant>\(i)</integerConstant>"
        case let .stringConstant(s):
            return "<stringConstant>\(s)</stringConstant>"
        }
    }

    private static func xmlSafe(_ c: Character) -> String {
        if c == "<" {
            return "&lt;"
        }
        if c == ">" {
            return "&gt;"
        }
        if c == "\"" {
            return "&quot;"
        }
        if c == "&" {
            return "&amp;"
        }
        return String(c)
    }
}

class JackTokenizer {

    /**
     Parses the Jack source to identify and return individual tokens
     */
    static func parseJackSource(_ source: String) -> [TokenType] {
        var tokens: [TokenType] = []
        var currentToken: String = ""
        var isInsideString: Bool = false
        // Iterate over the source character by character
        for c in source.unicodeScalars {
            if c == "\"" {
                // We are entering or exiting a string constant
                if isInsideString {
                    // We are exiting a string constant. Add the parsed constant to our array
                    tokens.append(.stringConstant(currentToken))
                    // We consumed the token. So we empty it before proceeding
                    currentToken = ""
                }
                // Flip this bool each time we encounter " character
                // NOTE that the parser logic will fail if the string itself has escaped " character
                // inside it. But that is not specified in language spec, so ¯\_(ツ)_/¯
                isInsideString = !isInsideString
            } else if CharacterSet.alphanumerics.contains(c) || isInsideString {
                // We are either inside a string, or encountered an alphanumeric character outside string.
                // Add character to current token and proceed with the iteration...
                currentToken += String(c)
            } else {
                // We are neither inside string, nor did we encounter an alphanumeric character.
                if !currentToken.isEmpty {
                    // Time to parse the current token if it's non empty
                    tokens.append(parseToken(currentToken))
                    // We consumed the token. So we empty it before proceeding.
                    currentToken = ""
                }
                if !CharacterSet.whitespacesAndNewlines.contains(c) {
                    // Current character is neither alphanumeric, nor blank, nor are we inside a string constant.
                    // So we parse it as a symbol.
                    tokens.append(.symbol(Character(c)))
                }
            }
        }
        return tokens
    }

    /**
     Parses the passed token to correct type
     */
    private static func parseToken(_ token: String) -> TokenType {
        if let k = Keyword.init(rawValue: token) {
            return .keyword(k)
        }
        if let i = Int(token) {
            return .intConstant(i)
        }
        return .identifier(token)
    }

    /**
     Generates XML from given tokens

     - parameter tokens: Array of tokens
     - parameter prettyFormat: Whether to generate a prettier version of XML. Default is true

     - returns: XML generated from passed tokens
     */
    static func generateXml(_ tokens: [TokenType], prettyFormat: Bool = true) -> String {
        var xml: String = "<tokens>"
        xml.append(prettyFormat ? "\n" : "")
        tokens.forEach { (token) in
            xml.append(token.xml())
            xml.append(prettyFormat ? "\n" : "")
        }
        xml.append("</tokens>")
        xml.append(prettyFormat ? "\n" : "")
        return xml
    }
}
