import UIKit

var greeting = "Hello, playground"
print(greeting)

let arr = [0, 1, 2]
let arr1 = arr.map{
    num in
    if num < 1 {
        return nil
    }
    return num
}
print(arr1)
