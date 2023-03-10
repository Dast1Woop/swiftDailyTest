//
//  ViewController.swift
//  PlaySoundWhenSilentSwitchOn
//
//  Created by LongMa on 2023/3/10.
//

import UIKit
import AVFoundation
import CoreMotion

class ViewController: UIViewController {
    
    var motionManager: CMMotionManager?
    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        motionManager = CMMotionManager()
        motionManager?.accelerometerUpdateInterval = 0.2
        motionManager?.startAccelerometerUpdates(to: OperationQueue.current!) { (data, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            if let acceleration = data?.acceleration {
                let magnitude = sqrt(pow(acceleration.x, 2) + pow(acceleration.y, 2) + pow(acceleration.z, 2))
                if magnitude > 2.5 {
                    self.playSound()
                }
            }
        }
    }
    
    func playSound() {
        
        /**AVAudioSessionCategorySoloAmbient: Your audio is silenced by screen locking and by the Silent switch
         
         AVAudioSessionCategoryPlayBack: Your Audio continues with the Silent switch set to silent or when the screen locks
         */
        try! AVAudioSession.sharedInstance().setCategory(.playback)
        
        let soundURL = Bundle.main.url(forResource: "shakestart", withExtension: "mp3")!
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
    
    deinit {
        motionManager?.stopAccelerometerUpdates()
    }
    
}

