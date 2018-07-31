import Foundation

func writeTokenizerXml() {
    let input = CommandLine.arguments[1]
    guard let fileHandler = try? FileHandler(withPath: input, inputExt: "jack", outputExt: "gen.xml") else {
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
    let clazz =
"""
class Main {
    field int a, b;
    static String c, d;

    function int main(int argc, Array argv) {
        var float f, g;
    }

    method void foo() {
        var Car c;
        var Bus bus;
    }
}
"""
    do {
        try print(JackParser.parseTokens(JackTokenizer.tokenizeJackSource(clazz)))
    } catch {
        print("\(error)")
        exit(1)
    }
}

writeParserXml()
