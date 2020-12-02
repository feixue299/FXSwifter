import XCTest
@testable import FXSwifter

final class FXSwifterSkipWhileTests: XCTestCase {
    let arr: Array<Int> = [1, 2, 3]
    
    func testLess() {
        var takeArr = arr.skipWhile(closure: { $0 < 4 })
        XCTAssert(takeArr.next() == nil)
    }
    
    func testEquatal() {
        var takeArr = arr.skipWhile(closure: { $0 <= 3 })
        XCTAssert(takeArr.next() == nil)
    }
    
    func testMore() {
        var takeArr = arr.skipWhile(closure: { $0 < 2 })
        
        XCTAssert(takeArr.next() == 2)
        XCTAssert(takeArr.next() == 3)
        XCTAssert(takeArr.next() == nil)
    }
}
