//
//  ViewController.swift
//  GCDSwiftWWDC16
//
//  Created by LongMa on 2022/2/16.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        test()
        
        testThreadExplosion()
    }
    
    //居然不崩溃！持续log😓，改用oc测试
    func testThreadExplosion(){
        for i in 0..<100000{
            DispatchQueue.global().async {
                Thread.sleep(forTimeInterval: 1)
                print(Thread.current)
                print(i)
            }
        }
    }
    
    /*start -------
     high- <NSThread: 0x280133b80>{number = 5, name = (null)}
     <NSThread: 0x280120600>{number = 4, name = (null)}
     1
     <NSThread: 0x280120600>{number = 4, name = (null)}
     2
     <_NSMainThread: 0x280174500>{number = 1, name = main}
     3 syn
     end -------
     high-2.1
     high- <NSThread: 0x280133b80>{number = 5, name = (null)}
     <NSThread: 0x280120600>{number = 4, name = (null)}
     3 asyn
     high-2.5
     <NSThread: 0x280120600>{number = 4, name = (null)}
     4
     <NSThread: 0x280120600>{number = 4, name = (null)}
     5
     <_NSMainThread: 0x280174500>{number = 1, name = main}
     group done!

     */
    private func test(){

//        let qGlobal = DispatchQueue.global()
        
        //同一个queue，不同async，默认在同一个线程 fifo 执行
        //如果需要设置优先级，最好在创建队列时指定qos；这样好理解(优先级高的队列先开启 新线程 执行；优先级低的 相对较晚 开启 其他新线程 执行，但不会等优先级高的子线程执行完再开启)。
        //在async方法中指定qos时，结果不好预测和理解。
        let queueBG = DispatchQueue.init(label: "bg Queue", qos: DispatchQoS.background)
        let queueUserInteractive = DispatchQueue.init(label: "queueUserInteractive Queue", qos: DispatchQoS.userInteractive)

        let queueGroup = DispatchGroup.init()
        
        print("start -------")
        
        queueBG.async(group: queueGroup, execute: DispatchWorkItem.init(block: {
            Thread.sleep(forTimeInterval: 2)
            print(Thread.current)
            print("1")
        }))

        queueBG.async(group: queueGroup, execute: DispatchWorkItem.init(block: {
            Thread.sleep(forTimeInterval: 1)
            print(Thread.current)
            print("2")
        }))
        
        //assignCurrentContext ?
        let item3 = DispatchWorkItem.init(qos: .userInteractive, flags: DispatchWorkItemFlags.assignCurrentContext) {
            print(Thread.current)
            print("3")
        }
        queueBG.async(execute: item3)
        
        queueUserInteractive.async(group: queueGroup) {
            print("high-",Thread.current)
            Thread.sleep(forTimeInterval: 5)
            print("high-2.1")
        }
        
        queueUserInteractive.async(group: queueGroup) {
            print("high-",Thread.current)
            Thread.sleep(forTimeInterval: 1)
            print("high-2.5")
        }

        queueBG.sync(execute: DispatchWorkItem.init(block: {
            Thread.sleep(forTimeInterval: 1)
            print(Thread.current)
            print("3 syn")
        }))
        
        queueBG.async(execute: DispatchWorkItem.init(block: {
            Thread.sleep(forTimeInterval: 1)
            print(Thread.current)
            print("3 asyn")
        }))

        queueBG.async(group: queueGroup, execute: DispatchWorkItem.init(block: {
            Thread.sleep(forTimeInterval: 2)
            print(Thread.current)
            print("4")
        }))

        queueBG.async(group: queueGroup, execute: DispatchWorkItem.init(block: {
            Thread.sleep(forTimeInterval: 1)
            print(Thread.current)
            print("5")
        }))


        queueGroup.notify(queue: DispatchQueue.main, work: DispatchWorkItem.init(block: {
            print(Thread.current)
            print("group done!")
        }))
        
        print("end -------")

    }


}

