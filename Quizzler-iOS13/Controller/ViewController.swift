//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    var quizBrain = QuizBrain()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(option1.titleLabel?.text! as Any)
        print(option2.titleLabel?.text! as Any)
        print(option3.titleLabel?.text! as Any)
        updateUI()
        progressBar.progress = 0
        
    }
   
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle! //True, False
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
            
        } else {
            sender.backgroundColor = UIColor.red
        }

        quizBrain.nextQuestion()
        print(option1.titleLabel?.text! as Any)
        print(option2.titleLabel?.text! as Any)
        print(option3.titleLabel?.text! as Any)

        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)

    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        option1.setTitle(quizBrain.getAnswerText()[0], for: .normal)
        option2.setTitle(quizBrain.getAnswerText()[1], for: .normal)
        option3.setTitle(quizBrain.getAnswerText()[2], for: .normal)

        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        option1.backgroundColor = UIColor.clear
        option2.backgroundColor = UIColor.clear
        option3.backgroundColor = UIColor.clear
        
//        progressBar.progress = Float(questionNumber+1) / Float(quiz.count)
    }
}

