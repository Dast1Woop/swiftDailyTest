//
//  ViewController.swift
//  MYCycleScrollV
//
//  Created by LongMa on 2021/3/31.
//  Copyright © 2021 myl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let KMargin: CGFloat = 40
    let gH4SV: CGFloat = 200
    let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    var gVM:ScrollPageVM?
    
    lazy var gScrollV:UIScrollView = {
        let lScrollV = UIScrollView.init()
        lScrollV.showsHorizontalScrollIndicator = false
        lScrollV.delegate = self
        
        //开启后，不用自己费心处理 减速（Decelerate）后 的结束位置了！！！
        lScrollV.isPagingEnabled = true
        return lScrollV
    }()
    
    lazy var gPageC:UIPageControl = {
        let lWidth = scrollViewWidth()
        let lPageC = UIPageControl()
        lPageC.pageIndicatorTintColor = .lightGray
        lPageC.currentPageIndicatorTintColor = .orange
        //        lPageC.isUserInteractionEnabled = false
        return lPageC
    }()
    
    
    /// 记录当前页码器下标
    var gCrtIndex4PageC = 0
    var gTimer:Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        setUpData()
        startTimer()
    }
    
    func setUpUI(){
        let lWidth = scrollViewWidth()
        
        let lHolderV = UIView.init(frame: CGRect.init(x: KMargin, y: (SCREEN_HEIGHT - gH4SV) * 0.5, width: lWidth, height: gH4SV))
        view.addSubview(lHolderV)
        
        lHolderV.addSubview(gScrollV)
        gScrollV.frame = lHolderV.bounds
        
        lHolderV.addSubview(gPageC)
        gPageC.frame = CGRect.init(x: 0, y: lHolderV.bounds.size.height - 44, width: lHolderV.bounds.size.width, height: 44)
        
        let lTextV = UITextView()
        lTextV.frame = CGRect.init(x: KMargin, y: lHolderV.frame.origin.y + lHolderV.frame.size.height + KMargin, width: lWidth, height: 100)
        lTextV.backgroundColor = .lightGray
        
        var str = ""
        for i in 0..<500{
            str += "hello-\(i) "
        }
        lTextV.text = str;
        view.addSubview(lTextV)
    }
    
    func setUpData(){
        let lWidth = scrollViewWidth()
        let lArrPicNames = ["3", "1", "2", "3", "1"]
        let lVM = ScrollPageVM(gArrData: lArrPicNames)
        gVM = lVM
        
        if let lCount = lVM.gArrData?.count{
            gScrollV.contentSize = CGSize.init(width: CGFloat(lCount) * lWidth, height: gH4SV)
            
            if lCount >= 4 {
                gPageC.numberOfPages = lCount - 2
                gPageC.currentPage = 0
                gScrollV.contentOffset = CGPoint(x: lWidth, y: 0)
            }else{
                gPageC.numberOfPages = 0
            }
            
            for i in 0..<lCount{
                
                //new imgV
                let lImgV = UIImageView.init(image: UIImage.init(named: lArrPicNames[i]))
                gScrollV.addSubview(lImgV)
                
                lImgV.frame = CGRect.init(x: (CGFloat)(i) * lWidth, y: 0, width: lWidth, height: gH4SV)
            }
        }
    }
    
    func startTimer(){
        if let timer = gTimer{
            RunLoop.current.add(timer, forMode: .common)
        }else{
            let lTimer = createTimer()
            gTimer = lTimer
            RunLoop.current.add(lTimer, forMode: .common)
        }
    }
    
    func createTimer()-> Timer{
        let lTimer = Timer(timeInterval: 1, repeats: true) { [weak self]
                  (timer) in
                  if let self = self{
                      let lWidth = self.scrollViewWidth()
                      if let lVM = self.gVM,let lArr = lVM.gArrData {
                          
                          //减去首尾两张补位图
                          let lPageCTotalNum = lArr.count - 2
                           //保证当前显示页左右都有页面->eg:显示3动画完成后，后面必须是1；显示1动画完成后，左边必须是3（整个视图结构：3-1-2-3-1），通过非动画设置偏移量实现。
                          if 0 == self.gCrtIndex4PageC {//开始自动往右滑，显示1动画完成后
                              self.gPageC.currentPage = 0
                              self.gScrollV.setContentOffset(CGPoint(x: lWidth, y: 0), animated: false)
                              
                              //                        self.gPageC.currentPage = lPageCTotalNum - 1
                              //                        self.gScrollV.setContentOffset(CGPoint(x: (CGFloat)(self.gPageC.currentPage) * lWidth + lWidth, y: 0), animated: true)
                          }else if(lPageCTotalNum == self.gCrtIndex4PageC){//自动往右滑到最后一页，显示1动画完成后
                              self.gPageC.currentPage = 0
                              self.gScrollV.setContentOffset(CGPoint(x: (CGFloat)(lPageCTotalNum + 1) * lWidth, y: 0), animated: true)
                              
                              //必须delay，否则上句代码尾部3-1动画被下面非动画代码打断
                              DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                                  self.gScrollV.setContentOffset(CGPoint(x: lWidth, y: 0), animated: false)
                              }
                              
                              self.gCrtIndex4PageC = 0
                          }else{
                              self.gPageC.currentPage = self.gCrtIndex4PageC
                              self.gScrollV.setContentOffset(CGPoint(x: (CGFloat)(self.gPageC.currentPage + 1) * lWidth, y: 0), animated: true)
                          }
                          
                          self.gCrtIndex4PageC += 1;
                      }
                      
                  }
              }
        return lTimer
    }
    
    func stopTimer(){
        if let timer = gTimer{
            if timer.isValid {
                timer.invalidate()
                gTimer = nil
            }
        }
        
    }
     
    func scrollViewWidth()->CGFloat {
        return CGFloat(SCREEN_WIDTH - KMargin * 2)
    }
}

extension ViewController:UIScrollViewDelegate{
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        stopTimer()
    }
    
    //注意：当开启 isPagingEnabled 且快速拖动时，在此回调返回的偏移量不准！！！不能用于更新页码器
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print(#function,"isDecelerate:",decelerate)
    }
    
    //更新页码器 + 减速完毕后检测是否属于首尾两张，是的话默默改变偏移量。必须配合 isPagingEnabled = true使用
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print(#function)
        updatePageControl(scrollView)
        handlePlayRepeatly(scrollView)
        
        startTimer()
    }
    
    func updatePageControl(_ scrollView: UIScrollView){
        let offset = scrollView.contentOffset
        let lWidth = scrollViewWidth()
        let lIndexCaled = ((Int)(offset.x)/(Int)(lWidth/2) + 1)/2
        
        if let lVM = gVM,let lArr = lVM.gArrData {
            
            //减去首尾两张补位图
            let lPageCTotalNum = lArr.count - 2
            if 0 == lIndexCaled {
                gCrtIndex4PageC = lPageCTotalNum - 1
            }else if(lIndexCaled > lPageCTotalNum){
                gCrtIndex4PageC = 0
            }else{
                gCrtIndex4PageC = lIndexCaled - 1
            }
            gPageC.currentPage = gCrtIndex4PageC;
        }
    }
    
    func handlePlayRepeatly(_ scrollView: UIScrollView){
        let lWidth = scrollViewWidth()
        if let lVM = gVM,let lArr = lVM.gArrData {
            
            //减去首尾两张补位图
            let lPageCTotalNum = lArr.count - 2
            if scrollView.contentOffset.x <= 10 {
                print("偷偷移到尾部区：2-*3-1（3-1-2-3-1），*代表正在显示")
                scrollView.setContentOffset(CGPoint(x: (CGFloat)(lPageCTotalNum) * lWidth, y: 0), animated: false)
            }else if(scrollView.contentOffset.x >= (CGFloat)(lPageCTotalNum + 1) * lWidth){
                print("偷偷移到头部区：3-*1-2（3-1-2-3-1），*代表正在显示")
                scrollView.setContentOffset(CGPoint(x: lWidth, y: 0), animated: false)
            }else{
                //do nothing
            }
        }
    }
}

