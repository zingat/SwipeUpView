# SwipeUpView

[![CI Status](https://img.shields.io/travis/kadirkemal/SwipeUpView.svg?style=flat)](https://travis-ci.org/kadirkemal/SwipeUpView)
[![Version](https://img.shields.io/cocoapods/v/SwipeUpView.svg?style=flat)](https://cocoapods.org/pods/SwipeUpView)
[![License](https://img.shields.io/cocoapods/l/SwipeUpView.svg?style=flat)](https://cocoapods.org/pods/SwipeUpView)
[![Platform](https://img.shields.io/cocoapods/p/SwipeUpView.svg?style=flat)](https://cocoapods.org/pods/SwipeUpView)

## SCREENSHOT

<img src="https://raw.githubusercontent.com/zingat/SwipeUpView/master/SwipeUpView.gif" width="200px">

## Installation

SwipeUpView is available through [CocoaPods](http://cocoapods.org). To install it, simply add the following line to your Podfile:

```
pod 'SwipeUpView'
```

## SwipeUpViewDatasource
```objectivec
extension ViewController : SwipeUpViewDatasource {

    func hideHeaderButton(_ swipeUpView: SwipeUpView) -> Bool {
        return false
    }

    func heightOfHeaderButton (_ swipeUpView : SwipeUpView) -> CGFloat {
        return 8.0
    }

    func marginOfHeaderButton (_ swipeUpView : SwipeUpView) -> CGFloat {
        return 4.0
    }

    func firstOpenHeightPercentageIndex(_ swipeUpView: SwipeUpView) -> Int {
        return 1
    }

    func heightPercentages(_ swipeUpView: SwipeUpView) -> [CGFloat] {
        return [0.1 ,0.5, 1]
    }

}
```

## SwipeUpViewDelegate
```objectivec
extension ViewController : SwipeUpViewDelegate {

    func swipeUpViewStateWillChange (_ swipeUpView : SwipeUpView, stateIndex : Int){
        NSLog("SwipeUpView state will change to %i", stateIndex)
    }

    func swipeUpViewStateDidChange (_ swipeUpView : SwipeUpView, stateIndex : Int){
        NSLog("SwipeUpView state did change to %i", stateIndex)
    }

    func swipeUpViewWillOpen (_ swipeUpView : SwipeUpView){
        NSLog("SwipeUpView state will open")
    }

    func swipeUpViewDidOpen (_ swipeUpView : SwipeUpView){
        NSLog("SwipeUpView state did open")
    }

    func swipeUpViewWillClose (_ swipeUpView : SwipeUpView){
        NSLog("SwipeUpView state will close")
    }

    func swipeUpViewDidClose (_ swipeUpView : SwipeUpView){
        NSLog("SwipeUpView state did close")
    }

}
```

## Authors

Zingat Mobile Team
+ Yusuf Çınar, https://github.com/cinaryusufiu
+ Kadir Kemal Dursun, https://github.com/KadirKemal

## License

RateMe is available under the MIT license. See the LICENSE file for more info.
