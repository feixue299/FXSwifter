import XCTest
@testable import FXSwifter

final class FXSwifterSkipTests: XCTestCase {
    func testLess() {
        let arr: Array<String> = ["str", "\(arc4random())"]
        
        var takeArr = arr.skip(count: 3)
        
        XCTAssert(takeArr.next() == nil)
    }
    
    func testEquatal() {
        let arr: Array<String> = ["str", "\(arc4random())", "\(arc4random())"]
        var takeArr = arr.skip(count: 3)
        
        XCTAssert(takeArr.next() == nil)
    }
    
    func testMore() {
        let arr: Array<String> = ["str", "\(arc4random())", "\(arc4random())", "\(arc4random())"]
        var takeArr = arr.skip(count: 3)
        
        XCTAssert(takeArr.next() == arr[3])
    }
}
