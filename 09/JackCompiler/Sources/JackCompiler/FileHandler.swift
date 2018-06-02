import Foundation

/**
 Various types of errors this class can throw
 */
enum FileHandlerError: Error {
    case fileOrDirNotFound(path: String)
    case invalidExtension(ext: String)
    case fileReadFailure(fileURL: URL)
    case fileWriteFailure(fileURL: URL)
}

/**
 Class to handle file IO for the compiler.
 The compiler program takes in a path which can either be a file or directory and passes it to an instance of this class
 FileHandler takes care of:

 - Providing a recursive iterator over files whose extension matches
    Eg. Given a directory and an extension, FileHandler provides an array of all files that match the extension
    in that directory, recursively. If given a file, the array simply contains that file
 - Writing the compiled contents of the input file to correct location with correct extenston.
    Given /a/b/c.vm input file and output string, FileHandler takes care of writing the output to /a/b/c.xml, or any
    other output extension provided.
 */
class FileHandler {

    /**
     The root URL within which to consider files or directories. Can be file URL or directory URL. It has to be a
     complete URL though. Behaviour in case of partial URLs is undefined.
    */
    let rootUrl: URL
    /**
     Only files having this extension within `rootURL` will be considered for further processing.
    */
    let inputExt: String
    /**
     When writing output file for a given input file, the name will be taken from input and extension will be this value.
    */
    let outputExt: String

    /**
     All input files having the `inputExt` extension inside `rootURL`. Recursive.
     */
    lazy var inputFiles: [URL] = {
        var tmp = [URL]()
        if self.rootUrl.hasDirectoryPath {
            let enumerator = FileManager.default.enumerator(at: self.rootUrl,
                                                            includingPropertiesForKeys: nil,
                                                            options: .skipsHiddenFiles,
                                                            errorHandler: nil)
            while let element = enumerator?.nextObject() as? URL {
                if element.pathExtension == self.inputExt {
                    tmp.append(element)
                }
            }
        } else if self.rootUrl.pathExtension == self.inputExt {
            tmp.append(self.rootUrl)
        }
        return tmp
    }()

    init(withPath path: String, inputExt: String, outputExt: String) throws {
        if !FileManager.default.fileExists(atPath: path) {
            throw FileHandlerError.fileOrDirNotFound(path: path)
        }

        if inputExt.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            throw FileHandlerError.invalidExtension(ext: inputExt)
        }

        if outputExt.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            throw FileHandlerError.invalidExtension(ext: inputExt)
        }

        self.rootUrl = URL(fileURLWithPath: path)
        self.inputExt = inputExt
        self.outputExt = outputExt
    }

    /**
     Returns the contents of the given file URL. Throws in case the file cannot be read for any reason.
    */
    func contents(ofFile fileURL: URL) throws -> String {
        guard let contents = try? String(contentsOf: fileURL, encoding: .utf8) else {
            throw FileHandlerError.fileReadFailure(fileURL: fileURL)
        }
        return contents
    }

    /**
     Writes the output file at the same path as input file, but with extension being `outputExt`
    */
    func write(output: String, forInputFile fileURL: URL) throws -> Void {
        let outputFile: URL = fileURL.deletingPathExtension().appendingPathExtension("\(self.outputExt)")
        guard let outputData = output.data(using: .utf8) else {
            throw FileHandlerError.fileWriteFailure(fileURL: outputFile)
        }
        let outputFileCreated: Bool = FileManager.default.createFile(atPath: outputFile.path,
                                                                     contents: outputData,
                                                                     attributes: nil)
        if !outputFileCreated {
            throw FileHandlerError.fileWriteFailure(fileURL: outputFile)
        }
    }
}
