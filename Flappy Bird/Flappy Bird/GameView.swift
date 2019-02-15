//
//  GameView.swift
//  Flappy Bird
//
//  Created by 马演喆 on 2019/2/14.
//  Copyright © 2019年 马演喆. All rights reserved.
//

import UIKit

protocol GameViewDelegate {
    func  passAPipe()
    func  gameEnded()
}

class GameView: UIView {

    fileprivate let gravity: CGFloat = 0.6
    fileprivate var bird = Bird()
    fileprivate var timer = Timer()
    fileprivate var pipes = [Pipe]()
    fileprivate var frameCount = 0
    
    var delegate: GameViewDelegate?
    
    override func draw(_ rect: CGRect) {
        bird.down(gravity)
        let birdPath = UIBezierPath(arcCenter: CGPoint(x: bird.x, y: bird.y), radius: bird.radius, startAngle: 0, endAngle: CGFloat(2 * M_PI), clockwise: false)
        UIColor.cyan.set()
        birdPath.fill()
        if bird.y + bird.radius >= self.frame.height || bird.y - bird.radius <= 0 {
            endGame()
            return
        }
        
        UIColor.green.set()
        for pipe in pipes{
            pipe.move(bird.xSpeed)
            
            if pipe.outScreen() {
                if delegate != nil{
                    delegate?.passAPipe()
                }
                pipes.removeFirst()
                continue
            }
            if frameCount == 100 {
                frameCount = 0
                pipes.append(Pipe())
            }
            
            if isHit(pipe) {
                endGame()
                return
            }
            
            let upPipe = UIBezierPath(rect: CGRect(x: pipe.x, y: 0, width: pipe.width, height: pipe.bottom))
            let downpipe = UIBezierPath(rect: CGRect(x: pipe.x, y: self.frame.height - pipe.bottom, width: pipe.width, height: pipe.bottom))
            upPipe.fill()
            downpipe.fill()
        }
        
        frameCount += 1
    }
    
    fileprivate func endGame() {
        bird = Bird()
        pipes = []
        frameCount = 0
        timer.invalidate()
    }
    
    fileprivate func isHit(_ pipe: Pipe) -> Bool {
        if bird.y > self.frame.height - pipe.bottom - bird.radius || bird.y < pipe.top + bird.radius{
            if bird.x > pipe.x - bird.radius && bird.x < pipe.x + pipe.width + bird.radius{
                return true
            }
        }
        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !timer.isValid{
            if delegate != nil{
                delegate?.gameEnded()
            }
            pipes.append(Pipe())
            timer = Timer.scheduledTimer(withTimeInterval: 0.005, repeats: true, block: { (timer) in
                self.setNeedsDisplay()
            })
        } else{
            bird.up()
        }
    }

}
