import Foundation

func writeTokenizerXml() {
    let input = CommandLine.arguments[1]
    guard let fileHandler = try? FileHandler(withPath: input, inputExt: "jack", outputExt: "token.xml") else {
        exit(1)
    }
    for file in fileHandler.inputFiles {
        guard let jackSource = try? fileHandler.contents(ofFile: file) else {
            exit(2)
        }
        let tokens = JackTokenizer.tokenizeJackSource(jackSource)
        let tokenizerXml = JackTokenizer.generateXml(tokens)
        do {
            try fileHandler.write(output: tokenizerXml, forInputFile: file)
        } catch {
            exit(3)
        }
    }
}

func writeParserXml() {
    let input = CommandLine.arguments[1]
    guard let fileHandler = try? FileHandler(withPath: input, inputExt: "jack", outputExt: "parser.xml") else {
        exit(1)
    }
    for file in fileHandler.inputFiles {
        guard let jackSource = try? fileHandler.contents(ofFile: file) else {
            exit(2)
        }
        let tokens = JackTokenizer.tokenizeJackSource(jackSource)
        do {
            let parserXml = try JackParser.parseTokens(tokens)
            //try fileHandler.write(output: parserXml, forInputFile: file)
        } catch {
            print("\(file.lastPathComponent) - \(error)")
            exit(3)
        }
    }
}

writeParserXml()
