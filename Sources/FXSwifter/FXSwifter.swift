public struct TakeIterator<I: IteratorProtocol>: Sequence, IteratorProtocol {
    public typealias Element = I.Element
    
    private var iterator: I
    private let takaCount: Int
    private var index: Int = 0
    
    init(iterator: I, takaCount: Int) {
        self.iterator = iterator
        self.takaCount = takaCount
    }
    
    mutating public func next() -> I.Element? {
        if index < takaCount {
            index += 1
            return iterator.next()
        } else {
            return nil
        }
    }
}

public extension IteratorProtocol {
    func take(count: Int) -> TakeIterator<Self> {
        return TakeIterator(iterator: self, takaCount: count)
    }
}

public extension Sequence {
    func take(count: Int) -> TakeIterator<Iterator> {
        return TakeIterator(iterator: self.makeIterator(), takaCount: count)
    }
}

public extension Sequence where Self: IteratorProtocol {
    func take(count: Int) -> TakeIterator<Iterator> {
        return TakeIterator(iterator: self.makeIterator(), takaCount: count)
    }
}

