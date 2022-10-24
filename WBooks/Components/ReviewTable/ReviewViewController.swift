//
//  ReviewViewController.swift
//  WBooks
//
//  Created by ana.mancuso on 17/10/2022.
//

import UIKit

class ReviewViewController: UIViewController {

    //MARK: Properties
    
    private lazy var reviewView = ReviewView()
    private let reviewViewModel: ReviewViewModel
    
    //MARK: Initialization
    
    init (reviewViewModel: ReviewViewModel) {
        self.reviewViewModel = reviewViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init? (coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reviewView.tableView.delegate = self
        reviewView.tableView.dataSource = self
        reviewView.tableView.registerCell(cellType: ReviewTableViewCell.self)
        reviewViewModel.loadSampleLibrarys() {
        self.reviewView.tableView.reloadData()
        }
    }
    
    override func loadView() {
        view = reviewView
    }
    
}
extension ReviewViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviewViewModel.reviewer.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ReviewTableViewCell.cellIdentifier, for: indexPath) as? ReviewTableViewCell  else {
            fatalError("The dequeued cell is not an instance of ReviewTableViewCell.")
        }
        cell.setupReviewData(reviewer: reviewViewModel.reviewer[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
}
