import UIKit

var greeting = "Hello, playground"

struct Book {
    var price:Int = 0
    var name:String = ""
}

let b1 = Book.init(price: 11, name: "白")
let b2 = Book.init(price: 40, name: "平凡的世界")
let b3 = Book.init(price: 10, name: "活着")
let b4 = Book.init(price: 66, name: "舌尖上的中国")
let b5 = Book.init(price: 38, name: "穆斯林的葬礼")

var arr = [b1, b2, b3, b4, b5]

///Returns the minimum element in the sequence, using the given predicate as the comparison between elements.
let minPriceBook = arr.min { b1, b2 in
    b1.price < b2.price
}
print(minPriceBook)

let minNameLengthBook = arr.min { b1, b2 in
    b1.name.count < b2.name.count
}
print(minNameLengthBook)

///Returns the maximum element in the sequence, using the given predicate as the comparison between elements.
let maxNameLengthBook = arr.max { b1, b2 in
    b1.name.count < b2.name.count
}
print(maxNameLengthBook)

///第一个价格 > 30 的书
let firstBookPriceAbove30 = arr.first { book in
    book.price > 30
}
print(firstBookPriceAbove30)

///移除 价格小于30的 所有书本
///removeAll: Removes all the elements that satisfy the given predicate.
let arrRemovedPriceBelow30 = arr.removeAll { book in
    book.price < 30
}

print(arrRemovedPriceBelow30)//empty
print("arr:",arr)//new arr satisfied
