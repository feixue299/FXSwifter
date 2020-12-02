import XCTest
@testable import FXSwifter

final class FXSwifterTakeWhileTests: XCTestCase {
    let arr: Array<Int> = [1, 2, 3]
    
    func testLess() {
        var takeArr = arr.takeWhile(closure: { $0 > 3 })
        XCTAssert(takeArr.next() == nil)
    }
    
    func testEquatal() {
        var takeArr = arr.takeWhile(closure: { $0 <= 3 })
        
        XCTAssert(takeArr.next() == 1)
        XCTAssert(takeArr.next() == 2)
        XCTAssert(takeArr.next() == 3)
        XCTAssert(takeArr.next() == nil)
    }
    
    func testMore() {
        var takeArr = arr.takeWhile(closure: { $0 <= 2 })
        
        XCTAssert(takeArr.next() == 1)
        XCTAssert(takeArr.next() == 2)
        XCTAssert(takeArr.next() == nil)
    }
}
