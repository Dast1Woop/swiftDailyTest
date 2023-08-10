import Foundation
import UIKit
import PlaygroundSupport

open class MYVC:UIViewController {
    open override func viewDidLoad() {
        self.view.backgroundColor = .yellow
        
        view.frame = CGRect.init(x: 0, y: 0, width: 600, height: 900)
        
        let lbl = UILabel.init(frame: CGRect.init(x: 100, y: 100, width: 60, height: 44))
        lbl.text = "hi"
        view.addSubview(lbl)
        
        
        
        PlaygroundPage.current.liveView = view
        
        animate()
    }
    
    // 游戏方格维度
    var dimension: Int = 2
    // 数字格的宽度
    var width: CGFloat = 30
    // 格子与格子的间隔
    var padding: CGFloat = 10
    
    // 保存背景图数据
    var backgrounds: Array<UIView>!
    func animate() {
        backgrounds = Array<UIView>()
        setupGameMap()
        playAnimation()
    }
    
    /// 设置游戏视图
    func setupGameMap()
    {
        var x: CGFloat = 50
        var y: CGFloat = 50
        
        for i in 0..<dimension {
            print(i)
            y = 150
            for _ in 0..<dimension {
                // 初始化view
                let view = UIView(frame: CGRect(x: x, y: y, width: width, height: width))
                view.backgroundColor = UIColor.gray
                self.view.addSubview(view)
                self.backgrounds.append(view)
                y += padding + width
            }
            x += padding + width
        }
    }
    
    /// 设置动画
    func playAnimation()
    {
        for view in self.backgrounds {
            // 现将视图的大小变成之前的十分之一
            view.layer.setAffineTransform(CGAffineTransform(scaleX: 0.1, y: 0.1))
            
            // 设置动画特效，动画时长1秒
            UIView.animate(withDuration: 1, animations: {
                //在动画中有一个角度的旋转
                view.layer.setAffineTransform(CGAffineTransform(rotationAngle: 90))
                
            }) { (finished: Bool) in
                // 完成之后，用动画回复原状
                UIView.animate(withDuration: 1) {
                    view.layer.setAffineTransform(CGAffineTransform.identity)
                }
            }
        }
    }
    
}
