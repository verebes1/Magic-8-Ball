//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by verebes on 05/03/2018.
//  Copyright © 2018 A&D Progress. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var ballImageView: UIImageView!
    
    let say = SpeechSynthesizer()
    let answers = ["Yes","No", "Ask again later!", "The answer is yes", "I have no Idea"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        giveRandomAnswer()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func askPressed(_ sender: UIButton) {
        giveRandomAnswer()
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        giveRandomAnswer()
    }
    
    func animateBall() {
        var ballImageArray = [UIImage]()
        for i in 1...5 {
            ballImageArray.append(UIImage.init(named: "ball\(i)")!)
        }
        ballImageView.animationImages = ballImageArray
        ballImageView.animationDuration = 1.0
        ballImageView.animationRepeatCount = 1
        ballImageView.startAnimating()
    }
    
    func giveRandomAnswer() {
        animateBall()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            var randomAnswerIndex: UInt32 = 0
            randomAnswerIndex = arc4random_uniform(5)
            self.say.speak(whatToSpeak: self.answers[Int(randomAnswerIndex)])
            self.ballImageView.image = UIImage.init(named: "ball\(randomAnswerIndex + 1)")
        }
//        var randomAnswerIndex: UInt32 = 0
//        randomAnswerIndex = arc4random_uniform(5)
//        say.speak(whatToSpeak: answers[Int(randomAnswerIndex)])
//        ballImageView.image = UIImage.init(named: "ball\(randomAnswerIndex + 1)")
        //ballImageView.stopAnimating()
    }
    
}

