//
//  DetailsView.swift
//  WBooks
//
//  Created by ana.mancuso on 30/09/2022.
//

import UIKit

final class DetailsView: NibView {
    
    //MARK: Properties
    
    @IBOutlet var detailsBackground: UIView! {
        didSet {
            detailsBackground.backgroundColor = .aliceBlue
        }
    }
    @IBOutlet var headerView: UIView!
    @IBOutlet var commentsView: UIView! {
        didSet {
            commentsView.layer.cornerRadius = 10
            commentsView.backgroundColor = .white
            commentsView.layer.shadowColor = UIColor.darkGray.cgColor
            commentsView.layer.shadowRadius = 3
            commentsView.layer.shadowOpacity = 0.2
            commentsView.layer.shadowOffset = CGSize(width: 0.0, height: 0.1)
            commentsView.layer.masksToBounds = false
        }
    }
}
