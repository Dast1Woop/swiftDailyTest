import UIKit
import RxSwift

var greeting = "1Hello, playground"

//工程内vc没用，因为无法关联到liveView（无法import PlaygroundSupport）
let vc = ViewController.init()
vc.view?.frame = CGRect.init(x: 200, y: 110, width: 100, height: 100)
vc.view == nil

//palyground 下的 sources 文件夹下 vc，可关联 liveView，因此可以看到效果
let myvc = MYVC.init()
myvc.view

let obs = Observable.just(1)
obs.subscribe { item in
    print(item)
}

let bag = DisposeBag()
let timer = Observable<Int>.interval(RxTimeInterval.seconds(1), scheduler: MainScheduler.instance)
timer.subscribe(onNext: { item in
    print(item)
}).disposed(by: bag)
