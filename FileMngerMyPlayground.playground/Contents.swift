import UIKit
import Foundation

var greeting = "Hello, playground"
do{
   let docPath = try FileManager.default.contentsOfDirectory(atPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, false).last!)
    
    print(docPath)

}catch {
    print("dasdafsaf", error)
}
