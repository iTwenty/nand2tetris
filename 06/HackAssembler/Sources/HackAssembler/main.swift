import Foundation

func firstPass(_ asmLines: [String]) -> ([String], [String:Int]) {

    var symbolTable = defaultSymbolTable

    var latestSymbols: [String] = []
    var cleanedLines: [String] = []
    var cleanedIndex = 0

    for (index, line) in asmLines.enumerated() {
        let commentStartIndex = line.index(of: "/") ?? line.endIndex
        let trimmedLine = String(line[..<commentStartIndex]).trimmingCharacters(in: .whitespaces)
        guard !trimmedLine.isEmpty else {
            continue
        }

        let firstChar = trimmedLine[trimmedLine.startIndex]
        if firstChar == "(" {
            let symbolRange = trimmedLine.index(after: trimmedLine.startIndex)...trimmedLine.index(before: trimmedLine.endIndex)
            let symbol = String(trimmedLine[symbolRange].dropLast())
            guard defaultSymbolTable[symbol] == nil else {
                print("[Assemble error] : Built-in symbol redefined : \(symbol) at line \(index)")
                exit(42)
            }
            latestSymbols.append(symbol)
        } else {
            for latestSymbol in latestSymbols {
                guard symbolTable[latestSymbol] == nil else {
                    print("[Assemble error] : Duplicate symbol : \(latestSymbol) at line \(index - 1)")
                    exit(42)
                }
                symbolTable.updateValue(cleanedIndex, forKey: latestSymbol)
            }
            cleanedIndex += 1
            latestSymbols.removeAll()
            cleanedLines.append(trimmedLine)
        }
    }

    return (cleanedLines, symbolTable)
}

func handleAIx(_ instruction: String,
               at index: Int,
               withSymbolTable symbolTable: inout [String:Int],
               withNewVariableAddress address: inout Int) -> String? {
    let str = String(instruction.dropFirst())
    let strInt = Int(str) ?? symbolTable[str] ?? {
        symbolTable[str] = address
        address += 1
        return symbolTable[str]!
    }()
    let binaryString = String(strInt, radix: 2)
    return String(repeatElement("0", count: 16 - binaryString.count)) + binaryString
}

func handleCIx(_ instruction: String, at index: Int) -> String? {

    let str: [String] = instruction.split { return $0 == "=" || $0 == ";" }.map { $0.filter { $0 != " " } }
    guard str.count > 0 && str.count < 4 else {
        return nil
    }

    let (cmp, dst, jmp): (String, String, String) = {
        switch str.count {
        case 1: return (str[0], "", "")
        case 2: return str[1].starts(with: "J") ? (str[0], "", str[1]) : (str[1], str[0], "")
        case 3: return (str[0], str[1], str[2])
        default: return ("", "", "")
        }
    }()

    guard !cmp.isEmpty else {
        return nil
    }

    let cmpHack = cmpTable[cmp]
    let dstHack = dstTable[dst]
    let jmpHack = jmpTable[jmp]

    guard cmpHack != nil else {
        return nil
    }

    return "111\(cmpHack!)\(dstHack ?? "000")\(jmpHack ?? "000")"
}

func secondPass(_ cleanedLines: [String], _ symbolTable: inout [String: Int]) -> [String] {
    var hackLines: [String] = []
    var variableAddress = 16

    for (index, line) in cleanedLines.enumerated() {
        let commentStartIndex = line.index(of: "/") ?? line.endIndex
        let trimmedLine = String(line[..<commentStartIndex]).trimmingCharacters(in: .whitespaces)
        guard !trimmedLine.isEmpty && !trimmedLine.starts(with: "(") else {
            continue
        }

        let firstChar = trimmedLine[trimmedLine.startIndex]
        var hackLine: String? = nil
        if firstChar == "@" {
            hackLine = handleAIx(line, at: index, withSymbolTable: &symbolTable, withNewVariableAddress: &variableAddress)
        } else {
            hackLine = handleCIx(line, at: index)
        }
        guard hackLine != nil else {
            print("[Assemble error] : Failed to parse instruction : \(line) at line \(index)")
            exit(42)
        }
        hackLines.append(hackLine!)
    }
    return hackLines
}

func go() -> Void {
    guard CommandLine.argc == 2 else {
        print("Usage : HackAssembler <input-file>")
        exit(1)
    }

    let asmFilePath = CommandLine.arguments[1]
    let asmFileURL: URL = asmFilePath.starts(with: "/") ?
        URL(fileURLWithPath: asmFilePath) :
        URL(fileURLWithPath: asmFilePath, relativeTo: FileManager.default.homeDirectoryForCurrentUser)
    guard FileManager.default.fileExists(atPath: asmFileURL.path) else {
        print("No such file : \(asmFileURL.path)")
        exit(2)
    }
    let asmOpt = try? String(contentsOf: asmFileURL, encoding: .utf8)
    guard let asm = asmOpt else {
        print("Failed to open asm file : \(asmFileURL.path)")
        exit(2)
    }

    let hackFileURL: URL = asmFileURL.deletingPathExtension().appendingPathExtension("hack")
    FileManager.default.createFile(atPath: hackFileURL.path, contents: nil, attributes: nil)
    let hackFileHandleOpt = try? FileHandle(forWritingTo: hackFileURL)
    guard let hackFileHandle = hackFileHandleOpt else {
        print("Failed to open hack file : \(hackFileURL.path)")
        exit(2)
    }

    let asmLines = asm.components(separatedBy: .newlines)
    let (cleanedLines, symbolTable) = firstPass(asmLines)
    var mutableSymbolTable = symbolTable
    let hackLines = secondPass(cleanedLines, &mutableSymbolTable)

    hackLines.forEach { (line) in
        guard let lineData = line.data(using: .utf8) else {
            print("Failed to write hack line : \(line)")
            hackFileHandle.closeFile()
            exit(2)
        }
        hackFileHandle.write(lineData)
        hackFileHandle.write("\n".data(using: .utf8)!)
    }
    hackFileHandle.closeFile()

}

go()
