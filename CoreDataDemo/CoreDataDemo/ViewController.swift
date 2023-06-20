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
    var id:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        
        // Do any additional setup after loading the view.
        initCoreData()
        addDogs()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        readDogs()
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
    
    func addDogs() {
        guard let dbContainer else {
            return
        }
        
        //异步加入元素
        dbContainer.performBackgroundTask { context in
            
            ["dog1", "dog2", "dog3", nil].forEach { name in
                let dog = Dog(context: context)
                dog.name = name
                dog.id = Int16(self.id)
                self.id += 1
            }
            
            do {
                print("save!!!")
                try context.save()
            }catch {
                fatalError(error.localizedDescription)
            }
        }
    }
    
    func readDogs() {
        guard let dbContainer else {
            return
        }
        
        let rqst = NSFetchRequest<Dog>(entityName: "Dog")
        
        let desc = NSSortDescriptor.init(key: "name", ascending: false)
        rqst.sortDescriptors = [desc]
        
       let asyncFetchRqst = NSAsynchronousFetchRequest<Dog>(fetchRequest: rqst) { rslt in
           guard let finalRslt = rslt.finalResult else {
               return
           }
           
           //to main thread
           DispatchQueue.main.async {
               
               //safe obj
               let safeArr = finalRslt.lazy.compactMap { rslt in
                  return rslt.objectID
               }.compactMap { id in
                   return dbContainer.viewContext.object(with: id) as? Dog
               }
               
               safeArr.forEach { dog in
                   print("dog:",dog.name as Any, ",", dog.id)
               }
               
           }
        }
        
        let context = dbContainer.newBackgroundContext()
        do {
            try context.execute(asyncFetchRqst)
        }catch {
            print(error)
        }
    }
    
    
}

