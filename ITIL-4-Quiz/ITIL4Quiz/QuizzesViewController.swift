//
//  QuizSelectionViewController.swift
//  ITIL4Quiz
//
//  Created by Cengizhan Tomak on 2.05.2023.
//

import UIKit

class QuizzesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var selectedTopic: Topic!
    var language: Language!
    var quizzes: [Quiz] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedTopic.title
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedTopic.quizzes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuizCell") as! QuizzesTableViewCell
        cell.label.text = selectedTopic.quizzes[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showQuestions", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showQuestions" {
            let viewController = segue.destination as! QuestionsViewController
            viewController.selectedQuiz = selectedTopic.quizzes[sender as! Int]
            viewController.language = language
        }
    }
}
