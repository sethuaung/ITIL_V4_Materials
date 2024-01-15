//
//  TopicsViewController.swift
//  ITIL4Quiz
//
//  Created by Cengizhan Tomak on 2.05.2023.
//

import UIKit

class TopicsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var language: Language!
    var topics: [Topic] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadTopics()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func loadTopics() {
        switch language {
        case .turkish:
            topics = sampleTopicsTurkish
        case .english:
            topics = sampleTopicsEnglish
        case .none:
            fatalError("Language not set in TopicsViewController")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopicCell", for: indexPath)
        cell.textLabel?.text = topics[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "showQuizzes", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showQuizzes" {
            let quizzesViewController = segue.destination as! QuizzesViewController
            quizzesViewController.selectedTopic = topics[sender as! Int]
            quizzesViewController.language = language
        }
    }
}
