import XCTest
@testable import FXSwifter

final class FXSwifterTests: XCTestCase {
    func testLess() {
        let arr: Array<String> = ["str", "\(arc4random())"]
        
        let takeArr = arr.take(count: 3)
        for (index, item) in takeArr.enumerated() {
            XCTAssert(item == arr[index])
        }
    }
    
    func testEquatal() {
        
        let arr: Array<String> = ["str", "\(arc4random())", "\(arc4random())"]

        let takeArr = arr.take(count: 3)
        for (index, item) in takeArr.enumerated() {
            XCTAssert(item == arr[index])
        }
    }
    
    func testMore() {
        let arr: Array<String> = ["str", "\(arc4random())", "\(arc4random())", "\(arc4random())"]

        let takeArr = arr.take(count: 3)
        
        for (index, item) in takeArr.enumerated() {
            XCTAssert(item == arr[index])
        }
    }
}
