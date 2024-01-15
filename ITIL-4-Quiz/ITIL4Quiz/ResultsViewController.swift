//
//  ResultsViewController.swift
//  ITIL4Quiz
//
//  Created by Cengizhan Tomak on 2.05.2023.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    var correctAnswers = 0
    var totalQuestions = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        displayResult()
    }
    
    func displayResult() {
        resultLabel.text = "Correct Answers:\n\(correctAnswers) / \(totalQuestions)"
    }
}
