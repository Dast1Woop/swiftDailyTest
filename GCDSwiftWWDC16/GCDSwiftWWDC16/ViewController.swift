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
        
        test()
    }
    
    private func test(){

        let qGlobal = DispatchQueue.global()
        
        //同一个queue，不同async，默认在同一个线程 fifo 执行
        let queueSelf = DispatchQueue.init(label: "selfQueue")

        let queueGroup = DispatchGroup.init()
        
        print("start -------")
        
        queueSelf.async(group: queueGroup, execute: DispatchWorkItem.init(block: {
            Thread.sleep(forTimeInterval: 2)
            print(Thread.current)
            print("1")
        }))

        queueSelf.async(group: queueGroup, execute: DispatchWorkItem.init(block: {
            Thread.sleep(forTimeInterval: 1)
            print(Thread.current)
            print("2")
        }))

        qGlobal.sync(execute: DispatchWorkItem.init(block: {
            Thread.sleep(forTimeInterval: 1)
            print(Thread.current)
            print("3 syn")
        }))
        
        qGlobal.async(execute: DispatchWorkItem.init(block: {
            Thread.sleep(forTimeInterval: 1)
            print(Thread.current)
            print("3 asyn")
        }))

        queueSelf.async(group: queueGroup, execute: DispatchWorkItem.init(block: {
            Thread.sleep(forTimeInterval: 2)
            print(Thread.current)
            print("4")
        }))

        queueSelf.async(group: queueGroup, execute: DispatchWorkItem.init(block: {
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

