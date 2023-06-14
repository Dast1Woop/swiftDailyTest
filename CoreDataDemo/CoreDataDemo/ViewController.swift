//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by LongMa on 2023/6/13.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    var dbContainer:NSPersistentContainer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        
        // Do any additional setup after loading the view.
        initCoreData()
        testOperate()
    }
    
    func initCoreData(){
        let dlgt = UIApplication.shared.delegate as? AppDelegate
        guard let dlgt, let dbContainer = dlgt.dbContainer else {
            return
        }
        
        self.dbContainer = dbContainer
        dbContainer.loadPersistentStores(completionHandler: {
            desc,error  in
            print(desc)
            if let error {
                print(error)
            }
        })
    }
    
    func testOperate() {
        guard let dbContainer else {
            return
        }
        
        //异步加入元素
        dbContainer.performBackgroundTask { context in
            
            ["dog1", "dog2", "dog3"].forEach { name in
                let dog = Dog(context: context)
                dog.name = name
            }
          
            do {
                print("save!!!")
                try context.save()
            }catch {
                fatalError(error.localizedDescription)
            }
        }
    }


}

