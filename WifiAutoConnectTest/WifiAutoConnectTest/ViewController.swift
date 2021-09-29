//
//  ViewController.swift
//  WifiAutoConnectTest
//
//  Created by LongMa on 2021/9/29.
//

import UIKit
import NetworkExtension
import SystemConfiguration
import SVProgressHUD

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        
        view.backgroundColor = .yellow
        
//        wifiAutoConnect()
    }
    
    func wifiAutoConnect()  {
        let config = NEHotspotConfiguration.init(ssidPrefix: "dast", passphrase: "123456abc", isWEP: false)
        
        /* When joinOnce is set to true, the hotspot remains configured and connected only as long as the app that configured it is running in the foreground. The hotspot is disconnected and its configuration is removed when any of the following events occurs:
         The app stays in the background for more than 15 seconds.
         The device sleeps.
         The app crashes, quits, or is uninstalled.
         The app connects the device to a different Wi-Fi network.
         The user connects the device to a different Wi-Fi network.
         To disconnect the device from a hotspot configured with joinOnce set to true, call removeConfiguration(forSSID:).
         */
//        config.joinOnce = true
//        config.lifeTimeInDays = 7
        
        NEHotspotConfigurationManager.shared.apply(config) { (err) in
            if let err = err{
                print(err)
                self.view.backgroundColor = .red
                self.title = err.localizedDescription
            }else{
                print("suc")
                SVProgressHUD.showSuccess(withStatus: "suc")
                self.view.backgroundColor = .green
                self.title = "suc"
            }
        }
    }

    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
//        NEHotspotConfigurationManager.shared.removeConfiguration(forSSID: "TP-LINK_6AED")
//        view.backgroundColor = .yellow
//        title = "removeConfiguration"
        
        NEHotspotNetwork.fetchCurrent { (network) in
            if let network = network{
                
                print(network.ssid, network.bssid)
                    
                if false == network.ssid .hasPrefix("dast"){
                    SVProgressHUD.showError(withStatus: "当前连接wifi不是dast开头")
                    self.wifiAutoConnect()
                }else{
                    print("已连接 dast开头wifi")
                    SVProgressHUD.showSuccess(withStatus: "已连接 dast开头wifi")
                }
            }else{
                print("net == nil")
                SVProgressHUD.showError(withStatus: "当前连接wifi == nil")
                self.wifiAutoConnect()
            }
        }
        
        
    }

}

