//
//  Pipe.swift
//  Flappy Bird
//
//  Created by 马演喆 on 2019/2/15.
//  Copyright © 2019年 马演喆. All rights reserved.
//

import UIKit

class Pipe{
    
    var bottom: CGFloat = 0
    var top: CGFloat = 0
    var x: CGFloat = 0
    let width: CGFloat = 40
    
    init() {
        let screen = UIScreen.main.bounds
        let width = screen.width
        let height = screen.height
        
        x = width
        bottom = CGFloat(arc4random_uniform(100)) * 0.01 * height * 0.5
        top = CGFloat(arc4random_uniform(100)) * 0.01 * height * 0.5
    }
    
    func move(_ speed: CGFloat) {
        x -= speed
    }
    
    func outScreen() -> Bool {
        if x <= -width{
            return true
        } else {
            return false
        }
    }
}
