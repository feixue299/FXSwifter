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
    private var isFinished: Bool = false
    
    init(iterator: I, closure: @escaping (Element) -> Bool) {
        self.iterator = iterator
        self.closure = closure
    }
    
    public mutating func next() -> I.Element? {
        if !isFinished {
            if let next = iterator.next() {
                isFinished = closure(next)
                return next
            } else {
                isFinished = true
                return nil
            }
        } else {
            return nil
        }
    }
}

public struct SkipIterator<I: IteratorProtocol>: Sequence, IteratorProtocol {
    public typealias Element = I.Element
    
    private var iterator: I
    private let skipCount: Int
    private var hasSkipped: Bool = false
    
    init(iterator: I, skipCount: Int) {
        self.iterator = iterator
        self.skipCount = skipCount
    }
    
    mutating public func next() -> I.Element? {
        if !hasSkipped {
            hasSkipped = true
            for _ in 0..<skipCount {
                _ = iterator.next()
            }
        }
        return iterator.next()
    }
}

public struct SkipWhileIterator<I: IteratorProtocol>: Sequence, IteratorProtocol {
    public typealias Element = I.Element
    
    private var iterator: I
    private let closure: (Element) -> Bool
    private var hasSkipped: Bool = false
    
    init(iterator: I, closure: @escaping (Element) -> Bool) {
        self.iterator = iterator
        self.closure = closure
    }
    
    public mutating func next() -> I.Element? {
        if !hasSkipped {
            hasSkipped = true
            guard var next = iterator.next() else { return nil }
            
            while !closure(next) {
                guard let nx = iterator.next() else { return nil }
                next = nx
            }
        }
        return iterator.next()
    }
}

public extension IteratorProtocol {
    func take(count: Int) -> TakeIterator<Self> {
        return TakeIterator(iterator: self, takaCount: count)
    }
    
    func takeWhile(closure: @escaping (Element) -> Bool) -> TakeWhileIterator<Self> {
        return TakeWhileIterator(iterator: self, closure: closure)
    }
    
    func skip(count: Int) -> SkipIterator<Self> {
        return SkipIterator(iterator: self, skipCount: count)
    }
    
    func skipWhile(closure: @escaping (Element) -> Bool) -> SkipWhileIterator<Self> {
        return SkipWhileIterator(iterator: self, closure: closure)
    }
}

public extension Sequence {
    func take(count: Int) -> TakeIterator<Iterator> {
        return TakeIterator(iterator: self.makeIterator(), takaCount: count)
    }
    
    func takeWhile(closure: @escaping (Element) -> Bool) -> TakeWhileIterator<Iterator> {
        return TakeWhileIterator(iterator: self.makeIterator(), closure: closure)
    }
    
    func skip(count: Int) -> SkipIterator<Iterator> {
        return SkipIterator(iterator: self.makeIterator(), skipCount: count)
    }
    
    func skipWhile(closure: @escaping (Element) -> Bool) -> SkipWhileIterator<Iterator> {
        return SkipWhileIterator(iterator: self.makeIterator(), closure: closure)
    }
}

public extension Sequence where Self: IteratorProtocol {
    func take(count: Int) -> TakeIterator<Iterator> {
        return TakeIterator(iterator: self.makeIterator(), takaCount: count)
    }
    
    func takeWhile(closure: @escaping (Element) -> Bool) -> TakeWhileIterator<Iterator> {
        return TakeWhileIterator(iterator: self.makeIterator(), closure: closure)
    }
    
    func skip(count: Int) -> SkipIterator<Iterator> {
        return SkipIterator(iterator: self.makeIterator(), skipCount: count)
    }
    
    func skipWhile(closure: @escaping (Element) -> Bool) -> SkipWhileIterator<Iterator> {
        return SkipWhileIterator(iterator: self.makeIterator(), closure: closure)
    }
}

