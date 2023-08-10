import Foundation
import UIKit
import PlaygroundSupport

open
class MYVC:UIViewController {
    open override func viewDidLoad() {
        self.view.backgroundColor = .yellow
        
        view.frame = CGRect.init(x: 0, y: 0, width: 400, height: 600)
        
        let lbl = UILabel.init(frame: CGRect.init(x: 100, y: 100, width: 60, height: 44))
        lbl.text = "hi"
        view.addSubview(lbl)
        
        PlaygroundPage.current.liveView = view
    }
}
