//
//  ViewController.swift
//  MultiLineMultiWidthLabel
//
//  Created by LongMa on 2023/9/11.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var imgV: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .lightGray
        
        let relativeImgVFrame = imgV.convert(imgV.bounds, to: textView)
        
        let path = UIBezierPath(rect: relativeImgVFrame)
        
        //exclusionPaths必须是相对于 textView 的path，（0，0）点以 textView左上角为准！！！
        textView.textContainer.exclusionPaths = [
            UIBezierPath.init(rect: CGRect.init(x: 0, y: 0, width: 40, height: 40)),
            UIBezierPath.init(rect: CGRect.init(x: 80, y: 0, width: 40, height: 40)),
            path]
    }
}

