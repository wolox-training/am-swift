//
//  ReviewTableViewCell.swift
//  WBooks
//
//  Created by ana.mancuso on 12/10/2022.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {

    //    MARK: Properties
    @IBOutlet var reviewView: UIView!
    @IBOutlet var nameReviewer: UILabel!
    @IBOutlet var commentReviewer: UILabel! {
        didSet {
            commentReviewer.textColor = UIColor(red: 129/255, green: 129/255, blue: 129/255, alpha: 1)
        }
    }
    @IBOutlet var iconReviewer: UIImageView! {
        didSet {
            backgroundColor = .white
            iconReviewer.layer.cornerRadius = 25
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        reviewView.layer.cornerRadius = 10
        reviewView.layer.shadowColor = UIColor.darkGray.cgColor
        reviewView.layer.shadowRadius = 3
        reviewView.layer.shadowOpacity = 0.2
        reviewView.layer.shadowOffset = CGSize(width: 0.0, height: 0.1)
        reviewView.layer.masksToBounds = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setupReviewData(reviewer: Reviewer?) {
        nameReviewer.text = reviewer?.name
        commentReviewer.text = reviewer?.comment
        self.iconReviewer?.downloaded(from: reviewer?.photo ?? "")
    }
    
}
