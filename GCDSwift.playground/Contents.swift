import UIKit

var greeting = "Hello, playground"

let qGlobal = DispatchQueue.global()
let queueSelf = DispatchQueue.init(label: "selfQueue")

let queueGroup = DispatchGroup.init()
queueSelf.async(group: queueGroup, execute: DispatchWorkItem.init(block: {
    print("1")
}))

queueSelf.async(group: queueGroup, execute: DispatchWorkItem.init(block: {
    print("2")
}))

queueSelf.sync(execute: DispatchWorkItem.init(block: {
    print("3 syn")
}))

queueSelf.async(group: queueGroup, execute: DispatchWorkItem.init(block: {
    print("4")
}))

queueSelf.async(group: queueGroup, execute: DispatchWorkItem.init(block: {
    print("5")
}))


queueGroup.notify(queue: DispatchQueue.main, work: DispatchWorkItem.init(block: {
    print("group done!")
}))
