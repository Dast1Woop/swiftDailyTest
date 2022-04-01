import UIKit

var greeting = "Hello, playground"

//let any1:Any... = "hi"
//print(any1)

//func log(items:Any...){
//    let f = items.first
//    let uf = f.unsafelyUnwrapped
//    let anyuf = uf as! Any
//
////    items.map(<#T##transform: (Any) throws -> T##(Any) throws -> T#>)
//
//
//    print(items)
//}
//
//log(items:1...5)

 func text(with items: Any...) -> String {
     print(items)
     items.count
//     let firstItem = items.first
//     let unwrappedItem = firstItem.unsafelyUnwrapped
//
//     return unwrappedItem
     
//    let array = unwrappedItem as? [Any]
//
//     guard let array = array else{
//         return "\(unwrappedItem)"
//     }
     let array = items
    switch array.count {
    case 0:
        return String()
    case 1:
        return "\(array.first)"
    default:
        var text = "\n\n"
        for (index, element) in array.enumerated() {
            let type = Mirror(reflecting: element).subjectType
            let description = String(reflecting: element)
            text += "#\(index): \(type) | \(description)\n"
        }
        return text
    }
}
let str = text(with: "1")
//let str = text(with: "1","2")
//let str1 = text(with: ["1",2])
//let str2 = text(with: ["1","2"])
//let str1 = text(with: 1)
//let str1 = text(with: 1,2)
//let str1 = text(with: 1,2,3)
//let str1 = text(with: (1,2,3))
//let str1 = text(with: 1...3)

