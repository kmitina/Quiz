//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by DVKSH on 14.07.2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], cA: String) {
        text = q
        answer = a
        correctAnswer = cA
    }
}
