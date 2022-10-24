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
    @IBOutlet var headerView: UIView! {
        didSet {
            cornerAndShadow(view: headerView)
        }
    }
    @IBOutlet var commentsView: UIView! {
        didSet {
            cornerAndShadow(view: commentsView)
        }
    }
}
