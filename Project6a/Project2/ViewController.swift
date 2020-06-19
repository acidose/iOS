//
//  ViewController.swift
//  Project2
//
//  Created by Peter Romachov on 7/6/20.
//  Copyright © 2020 Peter Romachov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var scoreLabel: UILabel!
    
    var maxScore = 10
    var countries = [String]()
    var displayedFlags = [String]()
    var score = 0
    var correctAnswer = ""
    var tries = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries = ["estonia","france","germany","ireland","italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        scoreLabel.text = "Score: \(score) out of \(tries) tries"
        countries.shuffle()
        displayedFlags = [countries[0],countries[1],countries[2]]
        correctAnswer = displayedFlags[Int.random(in: 0...2)]
            
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = correctAnswer.uppercased()
    }
    
    func resetChallenge(action: UIAlertAction! = nil) {
        score = 0
        tries = 0
        askQuestion()
    }
    
    func raiseChallenge(action: UIAlertAction! = nil) {
        maxScore += 10
        askQuestion()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        tries += 1
        let answer = displayedFlags[sender.tag]
        
        if answer == correctAnswer {
            score += 1
            askQuestion()
        } else {
            let ac = UIAlertController(title: "Wrong", message: "You chose the flag of \(answer.uppercased()).", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
        }
        
        if score >= maxScore {
            let ac = UIAlertController(title: "Done!", message: "You've won with \(tries) tries!", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "+10", style: .default, handler: raiseChallenge))
            ac.addAction(UIAlertAction(title: "Reset", style: .destructive, handler: resetChallenge))
            present(ac, animated: true)
        }
        
        
    }
}

