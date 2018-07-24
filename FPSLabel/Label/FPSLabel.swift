//
//  FPSLabel.swift
//  FPSLabel
//
//  Created by zzqq on 2018/5/16.
//  Copyright © 2018年 yangguang. All rights reserved.
//

import UIKit

class FPSLabel: UILabel {
    fileprivate var lastTime: CFTimeInterval = 0
    fileprivate var count: Int = 0
    fileprivate var displayLink: CADisplayLink?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 5
        clipsToBounds = true
        textAlignment = .center
        textColor = UIColor.white
        backgroundColor = UIColor(white: 0, alpha: 0.6)
        font = UIFont(name: "Menlo", size: 13)
        
        //displayLink添加到一个RunLoop中，并设置target和selector方法，则每次屏幕刷新的时候，selector方法就会自动调用。
        displayLink = CADisplayLink.init(target: self, selector: #selector(displayLinkChange))
        displayLink?.add(to: RunLoop.main, forMode: .commonModes)
    }
    
    @objc fileprivate func displayLinkChange(link: CADisplayLink) {
        //timestamp:只读的CFTimeInterval，表示屏幕上一帧的时间戳。
        if lastTime == 0 {
            lastTime = link.timestamp
        }
        count = count + 1
        
        let timeDelta = link.timestamp - lastTime
        if timeDelta < 0.25 {
            return
        }
        
        //lastTime:上次刷新的时间戳
        lastTime = link.timestamp
        //刷新的次数/二次刷新相差的时间
        let fps = Double(count) / timeDelta
        count = 0
        
        self.textColor = UIColor(hue: CGFloat(0.27 * (fps/60.0 - 0.2)), saturation: 1, brightness: 0.9, alpha: 1)
        self.text = "\(Int(fps+0.5))FPS"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
