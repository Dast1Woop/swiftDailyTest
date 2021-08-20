//
//  SecVC.swift
//  RetainCycleTest
//
//  Created by LongMa on 2021/8/20.
//

import Foundation
import UIKit

class SecVC:UIViewController{
    var workItem: DispatchWorkItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         前提: block循环嵌套，self 持有 外层 block 对象，如果 block 内部强引用 self，会导致循环引用
         结论：
         C、D不会循环引用；
         C:必须是 “外层 block” 使用 [weak self]，然后使用 self?.
         D:block 外面 let 复制一份self持有的对象，内部不使用 任何self
         推荐 C 方式，D方法难理解，且 block 内部引用多个外部对象时，容易出错。
         */
        testRetainCycleA()
//                testRetainCycleB()
//                testRetainCycleC()
//                testRetainCycleD()
//                testRetainCycleE()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#function)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true) {
            
        }
    }
    
    func testRetainCycleA(){
        let item = DispatchWorkItem.init {
            UIView.animate(withDuration: 1) {
                self.view.backgroundColor = .yellow
            }
        }
        workItem = item
    }
    
    func testRetainCycleB(){
        let item = DispatchWorkItem.init {
            UIView.animate(withDuration: 1) {[weak self] in
                self?.view.backgroundColor = .yellow
            }
        }
        workItem = item
    }
    
    func testRetainCycleC(){
        let item = DispatchWorkItem.init {[weak self] in
            UIView.animate(withDuration: 1) {
                self?.view.backgroundColor = .yellow
            }
        }
        workItem = item
    }
    
    func testRetainCycleD(){
        let view = self.view
        let item = DispatchWorkItem.init {
            UIView.animate(withDuration: 1) {
                view?.backgroundColor = .yellow
            }
        }
        workItem = item
    }
    
    func testRetainCycleE(){
        let view = self.view
        let item = DispatchWorkItem.init {
            UIView.animate(withDuration: 1) {
                [weak self] in//此处会⚠️，导致循环引用，因此警告尽量处理掉
                view?.backgroundColor = .yellow
            }
        }
        workItem = item
    }
    
    deinit {
        print(#function)
    }
    
}
