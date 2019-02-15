//
//  ViewController.swift
//  Flappy Bird
//
//  Created by 马演喆 on 2019/2/14.
//  Copyright © 2019年 马演喆. All rights reserved.
//

import UIKit

class ViewController: UIViewController, GameViewDelegate {

    @IBOutlet weak var gameView: GameView!
    @IBOutlet weak var scoreLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        gameView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func passAPipe() {
        let score = Int(scoreLabel.text!)!
        scoreLabel.text = String(score + 1)
    }
    
    func gameEnded() {
        scoreLabel.text = "0"
    }

}

