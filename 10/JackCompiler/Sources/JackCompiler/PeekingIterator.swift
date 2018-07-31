import Foundation

public struct PeekingIterator<C: Collection> : IteratorProtocol {
    let collection: C
    var iteratingIndex: C.Index

    public init(_ collection: C) {
        self.collection = collection
        iteratingIndex = self.collection.startIndex
    }

    public mutating func next() -> C.Iterator.Element? {
        guard self.iteratingIndex < self.collection.endIndex else {
            return nil
        }

        let result = self.collection[self.iteratingIndex]
        iteratingIndex = collection.index(after: self.iteratingIndex)
        return result
    }

    public func peek() -> C.Iterator.Element? {
        guard self.iteratingIndex < self.collection.endIndex else {
            return nil
        }

        return self.collection[self.iteratingIndex]
    }
}

extension Array {
    func makePeekingIterator() -> PeekingIterator<Array> {
        return PeekingIterator(self)
    }
}
