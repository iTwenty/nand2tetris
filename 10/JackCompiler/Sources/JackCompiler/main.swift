import Foundation

/**
 Cleans the Jack source code of comments, whitespaces etc
 and returns only the actual source needed for parsing
 */
func cleanJackSource(_ source: String) -> String {
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
 Entry point of the program
 */
func go() {
    let input = CommandLine.arguments[1]
    guard let fileHandler = try? FileHandler(withPath: input, inputExt: "jack", outputExt: "gen.xml") else {
        exit(1)
    }
    for file in fileHandler.inputFiles {
        guard let jackSource = try? fileHandler.contents(ofFile: file) else {
            exit(2)
        }
        let cleanedJackSource = cleanJackSource(jackSource)
        let tokens = JackTokenizer.parseJackSource(cleanedJackSource)
        let parserXml = JackTokenizer.generateXml(tokens)
        do {
            try fileHandler.write(output: parserXml, forInputFile: file)
        } catch {
            exit(3)
        }
    }
}

go()
