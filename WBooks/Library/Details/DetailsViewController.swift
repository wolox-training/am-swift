//
//  DetailsViewController.swift
//  WBooks
//
//  Created by ana.mancuso on 30/09/2022.
//

import UIKit

class DetailsViewController: UIViewController {

    private lazy var detailsV = DetailsView()
    private let detailsViewModel: DetailsViewModel
    
    init (detailsViewModel: DetailsViewModel) {
        self.detailsViewModel = detailsViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init? (coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configReviews()
        title = NSLocalizedString("TITLE_VIEW_DETAILS", comment: "")
        
    }
    
    override func loadView() {
        view = detailsV
    }

    func configReviews() {
        detailsV.tableView.delegate = self
        detailsV.tableView.dataSource = self
        detailsV.tableView.registerCell(cellType: ReviewTableViewCell.self)
        setupData(library: detailsViewModel.bookDetails)
        detailsViewModel.changeList = { [weak self] in
            self?.detailsV.tableView.reloadData()
        }
        detailsViewModel.loadSampleLibrarys()
        detailsV.rentButton.addTarget(self, action:#selector(rentButton), for: .touchUpInside)
        detailsV.rentButton.backgroundColor = (detailsV.availabilityBook.text == "Unavailable") ? .gray : UIColor(red: 30/255, green: 172/255, blue: 183/255, alpha: 1)
        detailsV.addButton.addTarget(self, action:#selector(addButton), for: .touchUpInside)
        detailsV.availabilityBook.textColor = (detailsV.availabilityBook.text == "Available") ? UIColor(red: 136/255, green: 176/255, blue: 50/255, alpha: 1) : UIColor(red: 211/255, green: 41/255, blue: 41/255, alpha: 1)
    }

    //MARK: Action
    
    @objc func addButton() {
    }
    @objc func rentButton() {
        alertConfiguration()
        detailsViewModel.rentLibrary()
    }
    
    func alertConfiguration () {
        let availableToF = (detailsV.availabilityBook.text.self != nil) ? "Available" : "Unavailable"
        let title = NSLocalizedString("ALERT_BOOKED_SUCCESSFULLY", comment: "")
        let succesTitle = NSLocalizedString("COMMENT_BOOKED_SUCCESFULLY", comment: "")
        let errorTitle = NSLocalizedString("COMMENT_BOOKED_ERROR", comment: "")
        let noRentTitle = NSLocalizedString("COMMENT_BOOKED_NO_RENT", comment: "")
        let noti = UIAlertController(title: title, message: succesTitle.capitalized, preferredStyle: .alert)
        let alert = UIAlertController(title: "OH NO!", message: noRentTitle.capitalized, preferredStyle: .alert)
        let error = UIAlertController(title: "ERROR", message: errorTitle.capitalized, preferredStyle: .alert)
        
        if availableToF == "Available" {
            noti.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            }))
            self.present(noti, animated: true, completion: nil)
        } else if availableToF == "Unavailable" {
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
        }
        else {
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(error, animated: true, completion: nil)
        }
    }
    func setupData(library: Library?) {
        detailsV.bookName.text = library?.name
        detailsV.authorBook.text = library?.name2
        detailsV.availabilityBook.text = library?.status
        detailsV.yearBook.text = library?.year
        detailsV.genreBook.text = library?.genre
        self.detailsV.bookImage?.downloaded(from: library?.photo ?? "")
    }
    
}
extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Table view data source

        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return detailsViewModel.reviewer.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cellIdentifier = "ReviewTableViewCell"
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ReviewTableViewCell  else {
                fatalError("The dequeued cell is not an instance of ReviewTableViewCell.")
            }
            cell.setupReviewData(reviewer: detailsViewModel.reviewer[indexPath.row])
            print("SetUpHecho")
            return cell
        }

        func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            return true
        }

}

