import UIKit

var greeting = "Hello, playground"

enum MyAlertType:Int,CaseIterable{
    case normal
    
    //error: enum with raw type cannot have cases with arguments
//    case medium(String)
    
    case medium
    case high
}

print(MyAlertType.allCases)

let lType = MyAlertType.medium
switch lType {
case .normal:
    print(lType)
case .medium:
    print(lType.rawValue)
case .high:
    print(lType)
}

