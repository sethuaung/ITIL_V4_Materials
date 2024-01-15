//
//  LanguageSelectionViewController.swift
//  ITIL4Quiz
//
//  Created by Cengizhan Tomak on 2.05.2023.
//

import UIKit

class LanguageSelectionViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func languageSelected(_ sender: UIButton) {
        let language: Language
        if sender.tag == 0 {
            language = .turkish
        } else {
            language = .english
        }
        performSegue(withIdentifier: "showTopics", sender: language)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTopics" {
            let topicsViewController = segue.destination as! TopicsViewController
            topicsViewController.language = sender as? Language
        }
    }
}
