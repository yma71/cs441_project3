//
//  Bird.swift
//  Flappy Bird
//
//  Created by 马演喆 on 2019/2/14.
//  Copyright © 2019年 马演喆. All rights reserved.
//

import UIKit

class Bird{
    
    var x: CGFloat = 64
    var y: CGFloat = 0
    var ySpeed: CGFloat = 0
    let xSpeed: CGFloat = 2
    let upForce: CGFloat = -15
    let radius: CGFloat = 24
    
    init() {
        let screen = UIScreen.main.bounds
        let height = screen.height * 0.5
        y = height
    }
    
    func down(_ gravity: CGFloat) {
        ySpeed += gravity
        ySpeed *= 0.95
        y += ySpeed
    }
    
    func up() {
        ySpeed += upForce
        ySpeed *= 0.95
        y += ySpeed
    }
    
}
