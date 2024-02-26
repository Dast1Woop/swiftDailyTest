//
//  ViewController.swift
//  RxSwiftDisposeMultiTImes
//
//  Created by LongMa on 2024/1/10.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    var dispo: Disposable?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        dispo?.dispose()
        
        dispo = Observable.just(1).subscribe(onNext: { item in
            print(item)
        })
        
        dispo?.dispose()
        dispo?.dispose()
        dispo?.dispose()
    }


}

