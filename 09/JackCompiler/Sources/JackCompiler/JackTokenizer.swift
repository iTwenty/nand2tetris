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
