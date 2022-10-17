//
//  DetailsViewController.swift
//  WBooks
//
//  Created by ana.mancuso on 30/09/2022.
//

import UIKit

class DetailsViewController: UIViewController {

    //MARK: Properties
    
    private lazy var detailsV = DetailsView()
    private let detailsViewModel: DetailsViewModel
    
    private let bookInfoViewController: BookInfoViewController
    private let reviewViewController: ReviewViewController
    
    //MARK: Initialization
    
    init(detailsViewModel: DetailsViewModel) {
        self.detailsViewModel = detailsViewModel
        let bookInfoViewModel = detailsViewModel.createBookViewModel()
        bookInfoViewController = BookInfoViewController(bookModel: bookInfoViewModel)
        let reviewViewModel = detailsViewModel.createReviewViewModel()
        reviewViewController = ReviewViewController(reviewModel: reviewViewModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSLocalizedString("TITLE_VIEW_DETAILS", comment: "")
        addChild(bookInfoViewController)
        detailsV.headerView.addSubview(bookInfoViewController.view)
        detailsV.headerView.addSubViewWithConstraints(child: bookInfoViewController.view, parent: detailsV.headerView)
        bookInfoViewController.didMove(toParent: self)
        
        addChild(reviewViewController)
        detailsV.commentsView.addSubview(reviewViewController.view)
        detailsV.commentsView.addSubViewWithConstraints(child: reviewViewController.view, parent: detailsV.commentsView)
        reviewViewController.didMove(toParent: self)
    }
    
    override func loadView() {
        view = detailsV
    }
    
}
