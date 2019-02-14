//
//  GameView.swift
//  Flappy Bird
//
//  Created by 马演喆 on 2019/2/14.
//  Copyright © 2019年 马演喆. All rights reserved.
//

import UIKit

class GameView: UIView {

    fileprivate let gravity: CGFloat = 0.6
    fileprivate let bird = Bird()
    fileprivate var timer = Timer()
    
    override func draw(_ rect: CGRect) {
        let birdPath = UIBezierPath(arcCenter: CGPoint(x: bird.x, y: bird.y), radius: bird.radius, startAngle: 0, endAngle: CGFloat(2 * M_PI), clockwise: false)
        UIColor.cyan.set()
        birdPath.fill()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !timer.isValid{
            timer = Timer.scheduledTimer(withTimeInterval: 0.005, repeats: true, block: { (timer) in
                self.bird.down(self.gravity)
                self.setNeedsDisplay()
            })
        } else{
            bird.up()
        }
    }

}
