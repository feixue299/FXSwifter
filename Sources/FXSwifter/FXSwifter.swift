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

public struct TakeWhileIterator<I: IteratorProtocol>: Sequence, IteratorProtocol {
    public typealias Element = I.Element
    
    private var iterator: I
    private let closure: (Element) -> Bool
    
    init(iterator: I, closure: @escaping (Element) -> Bool) {
        self.iterator = iterator
        self.closure = closure
    }
    
    public mutating func next() -> I.Element? {
        guard let next = iterator.next() else { return nil }
        return closure(next) ? next : nil
    }
}

public extension IteratorProtocol {
    func take(count: Int) -> TakeIterator<Self> {
        return TakeIterator(iterator: self, takaCount: count)
    }
    
    func takeWhile(closure: @escaping (Element) -> Bool) -> TakeWhileIterator<Self> {
        return TakeWhileIterator(iterator: self, closure: closure)
    }
}

public extension Sequence {
    func take(count: Int) -> TakeIterator<Iterator> {
        return TakeIterator(iterator: self.makeIterator(), takaCount: count)
    }
    
    func takeWhile(closure: @escaping (Element) -> Bool) -> TakeWhileIterator<Iterator> {
        return TakeWhileIterator(iterator: self.makeIterator(), closure: closure)
    }
}

public extension Sequence where Self: IteratorProtocol {
    func take(count: Int) -> TakeIterator<Iterator> {
        return TakeIterator(iterator: self.makeIterator(), takaCount: count)
    }
    
    func takeWhile(closure: @escaping (Element) -> Bool) -> TakeWhileIterator<Iterator> {
        return TakeWhileIterator(iterator: self.makeIterator(), closure: closure)
    }
}

