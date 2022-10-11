import UIKit

//var greeting:String? = "Hello, playground"
var greeting:String? = nil

switch greeting {
//case .some(str):
//    print(str)
//    break
case .some(let str):
    print(str)
default:
    print("nil")
}
