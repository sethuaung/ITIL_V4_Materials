//
//  QuestionsViewController.swift
//  ITIL4Quiz
//
//  Created by Cengizhan Tomak on 2.05.2023.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var answerButtons: [UIButton]!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var questionTextView: UITextView!
    
    var language: Language!
    var selectedQuiz: Quiz!
    var questions: [Question] = []
    var questionIndex = 0
    var correctAnswers = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadQuestions()
        displayQuestion()
    }
    
    func checkAnswer(_ sender: UIButton) {
        let correctAnswerIndex = questions[questionIndex].correctAnswerIndex
        let userSelectedIndex = answerButtons.firstIndex(of: sender)!
        
        if userSelectedIndex == correctAnswerIndex {
            sender.layer.borderColor = UIColor.blue.cgColor
            correctAnswers += 1
        } else {
            sender.layer.borderColor = UIColor.red.cgColor
            answerButtons[correctAnswerIndex].layer.borderColor = UIColor.blue.cgColor
        }
        answerButtons.forEach { $0.isEnabled = false }
        nextButton.isHidden = false
    }
    
    func goToNextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            displayQuestion()
            answerButtons.forEach { $0.isEnabled = true }
        } else {
            performSegue(withIdentifier: "showResults", sender: self)
        }
    }
    
    func loadQuestions() {
        questions = selectedQuiz.questions
    }
    
    func displayQuestion() {
        let question = questions[questionIndex]
        questionTextView.text = "\(questionIndex + 1)) " + question.question
        
        for (index, button) in answerButtons.enumerated() {
            button.setTitle(question.answers[index], for: .normal)
            button.layer.cornerRadius = 10
            button.layer.borderWidth = 3
            button.layer.borderColor = UIColor.lightGray.cgColor
            button.isEnabled = true
        }
        
        if language == .turkish {
            if questionIndex == questions.count - 1 {
                nextButton.setTitle("Sonuçları Gör", for: .normal)
            } else {
                nextButton.setTitle("Sonraki Soru", for: .normal)
            }
        } else if language == .english {
            if questionIndex == questions.count - 1 {
                nextButton.setTitle("See Results", for: .normal)
            } else {
                nextButton.setTitle("Next Question", for: .normal)
            }
        }
        nextButton.isHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResults" {
            let resultsViewController = segue.destination as! ResultsViewController
            resultsViewController.correctAnswers = correctAnswers
            resultsViewController.totalQuestions = questions.count
        }
    }
    
    @IBAction func answerSelected(_ sender: UIButton) {
        checkAnswer(sender)
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        goToNextQuestion()
    }
}
