//
//  QuizTableViewCell.swift
//  Quiz
//
//  Created by nttr on 2017/07/26.
//  Copyright © 2017年 net.nana.ichikawa. All rights reserved.
//

import UIKit

class QuizTableViewCell: UITableViewCell {

    @IBOutlet var quizDateLabel: UILabel!
    @IBOutlet var quizResultLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
