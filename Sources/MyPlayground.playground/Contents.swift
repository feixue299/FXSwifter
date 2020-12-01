import UIKit
import FXSwifter

let arr: Array<String> = ["str", "\(arc4random())", "\(arc4random())", "\(arc4random())", "\(arc4random())", "\(arc4random())", "\(arc4random())"]
let dic = ["key": 1, "yuo": 2]

var i = arr.makeIterator().take(count: 3)

while let next = i.next() {
    print("next:\(next)")
}
