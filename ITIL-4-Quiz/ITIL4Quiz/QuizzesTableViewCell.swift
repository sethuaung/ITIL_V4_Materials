//
//  QuizzesTableViewCell.swift
//  ITIL4Quiz
//
//  Created by Cengizhan Tomak on 2.05.2023.
//

import UIKit

class QuizzesTableViewCell: UITableViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        view.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
