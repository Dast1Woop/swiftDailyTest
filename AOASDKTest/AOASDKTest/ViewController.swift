//
//  ViewController.swift
//  AOASDKTest
//
//  Created by LongMa on 2021/4/8.
//

import UIKit
import RTLSSensor

class ViewController: UIViewController {
    
    let ble = Ble()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .orange
        
        let cannotUseArr = [0x56E6, 0x9730, 0x0BAA, 0x8E5C, 0xC403,0xDB34, 0x67F7, 0x2745,0xACCC, 0x2F61]
        let strArr = cannotUseArr.map {
            "\($0)"
        }

        var uuid = NSUUID.init()
        print("1",uuid)
        
        var uuidLast4Char = String(uuid.uuidString.suffix(4))
        
//        strArr.append((uuidLast4Char))
        
        while strArr.contains((uuidLast4Char)){
            uuid = NSUUID.init()
            uuidLast4Char = String(uuid.uuidString.suffix(4))
        }
        print("2",uuid)
        
        testAOA()
    }
    
    func testAOA() {
        ble.stateChange.then { (state) in
            print(state)
            if state == .poweredOn{
                self.ble.id = 0x5555
                self.ble.alarm = true
                self.ble.battery = 9
                do{
                    try self.ble.start()
                }
                 catch let err{
                    print(err)
                }
            }
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        ble.stop()
    }

}

