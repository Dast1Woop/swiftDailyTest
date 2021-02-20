import UIKit

let arr = [1,2,3]

//MARK:map(映射)：returns an Array containing results of applying a transform to each item.
arr.map { (value) -> Int in
   return value * 2
}

arr.map { (value) -> Int in
    value * 2
}

//闭包写在一行时，执行4次，第一次是闭包赋值操作
arr.map { (value) in value * 2}

let arr1 = arr.map {
    $0 * 2
}

arr.map {$0 * 2}

let arr2 = arr.map {"\($0)"}
print(arr2)

let dic = ["point1" : 10, "point2" : 20, "point3" : 30]
dic.map { (name,distance) -> Int in//参数是元组
    distance * 2
}
dic.map {$0.1 * 2}

//MARK:filter：returns an Array containing only those items that match an include condition.
let arrF0 = arr.filter { (num) -> Bool in
    num % 2 == 0
}

let arrF1 = arr.filter { $0 % 2 == 0 }
print(arrF1)

//MARK:reduce（归纳）：初始值+闭包("+"操作符本质也是闭包)。returns a single value calculated by calling a combine closure for each item with an initial value.
let sum = arr.reduce(10) {Result,num -> Int in
    Result + num
}
let sum1 = arr.reduce(10,+)

let dicR0 = dic.reduce("res:") { (Result, arg1) -> String in
    let (key, value) = arg1
    return Result + key + "\(value)" + ","
}

let dicR1 = dic.reduce("res:") { (Result, arg1) -> String in
    let (key, value) = arg1
    return key + "\(value)" + "!"
}

let arrStr = ["你", "好", "啊"]
let dicRStr0 = arrStr.reduce("归纳:"){res, str in res + str}
let dicRStr1 = arrStr.reduce("归纳:", +)

//MARK:flatMap（压平）:二维数组降维成一维；可选值转换为可选值
let arrWithArr = [[1, 2], [3, 4, 5], [6, 7]]
let arrFm = arrWithArr.flatMap{$0}
print(arrFm)

let num: Int? = Int(8);
let numFM = num.flatMap{$0 < 5 ? $0 : nil}

//MARK:compactMap（紧凑）:去 nil+变非可选
let arrWithNil: [String?] = ["1", nil, "2", nil]

//'flatMap' is deprecated: Please use compactMap(_:) for the case where closure returns an optional value
//arrWithNil.flatMap{$0}

let arrCm = arrWithNil.compactMap{$0}
print(arrCm)
 
//MARK:chaining（链式语法）
let resCh = arrWithArr.flatMap{$0}.filter{$0 > 5}.reduce(10, +)
print(resCh)

