import XCTest
@testable import FXSwifter

final class FXSwifterTakeTests: XCTestCase {
    func testLess() {
        let arr: Array<String> = ["str", "\(arc4random())"]
        
        var takeArr = arr.take(count: 3)
        
        for index in 0..<2 {
            XCTAssert(takeArr.next() == arr[index])
        }
        XCTAssert(takeArr.next() == nil)
    }
    
    func testEquatal() {
        let arr: Array<String> = ["str", "\(arc4random())", "\(arc4random())"]
        var takeArr = arr.take(count: 3)
        
        for index in 0..<3 {
            XCTAssert(takeArr.next() == arr[index])
        }
        XCTAssert(takeArr.next() == nil)
    }
    
    func testMore() {
        let arr: Array<String> = ["str", "\(arc4random())", "\(arc4random())", "\(arc4random())"]
        var takeArr = arr.take(count: 3)
        
        for index in 0..<3 {
            XCTAssert(takeArr.next() == arr[index])
        }
        XCTAssert(takeArr.next() == nil)
    }
}
