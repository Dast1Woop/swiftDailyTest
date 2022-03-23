import UIKit

var greeting = "Hello, playground"
let arr: [Any] = [1, "2", {(message:String) in print(message)}]
 let f = arr[2] as? (String)->Void
print(arr)

if let f = f{
    f("hi")
}
