import Foundation

class JackTokenizer {

    /**
     Tokenizes the Jack source to identify and return individual tokens
     */
    static func tokenizeJackSource(_ source: String) -> [TokenType] {
        let cleanedSource = cleanJackSource(source)
        var tokens: [TokenType] = []
        var currentToken: String = ""
        var isInsideString: Bool = false
        // Iterate over the source character by character
        for c in cleanedSource.unicodeScalars {
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
                    tokens.append(tokenize(currentToken))
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
     tokenize the passed string to correct token type
     */
    private static func tokenize(_ token: String) -> TokenType {
        if let k = Keyword.init(rawValue: token) {
            return .keyword(k)
        }
        if let i = Int(token) {
            return .intConstant(i)
        }
        return .identifier(token)
    }

    /**
     Cleans the Jack source code of comments, whitespaces etc
     and returns only the actual source needed for parsing
     */
    private static func cleanJackSource(_ source: String) -> String {
        let lines = source.components(separatedBy: .newlines)
        var cleanedLines :String = ""
        for line in lines {
            var cleanedLine = line
            // Remove portion of line after //
            if let range = cleanedLine.range(of: "//") {
                cleanedLine = String(cleanedLine[..<range.lowerBound])
            }
            cleanedLine = cleanedLine.trimmingCharacters(in: .whitespacesAndNewlines)
            // Exclude empty lines and comments in /**/ blocks.
            if cleanedLine.isEmpty
                || cleanedLine.hasPrefix("/*")
                || cleanedLine.hasPrefix("*") {
                continue
            }
            cleanedLines.append(cleanedLine)
        }
        return cleanedLines
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
