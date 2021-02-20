import UIKit

let res = Result<String, Error>.success("hehe")
if case .success(let su) = res{
    print(su)
    print(res)
}


enum Season{
    case Spring(des:String,tem:Int)
    case Summer(des:String,tem:Int)
    case Autumn(des:String,tem:Int)
    case Winter(des:String,tem:Int)
}

let sea: Season? = Season.Spring(des: "春天", tem: 6)

switch sea {
case .Spring(let des, let tem):
    print(des, tem)
default:
    print("default")
}

if case .Spring(let des, let tem) = sea{
    print(des, tem, "度")
}


