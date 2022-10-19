//
//  LibraryTableViewController.swift
//  WBooks
//
//  Created by ana.mancuso on 27/09/2022.
//

import UIKit

class LibraryTableViewController: UIViewController {
    
    private lazy var libraryTableView = LibraryTableView()
    private let libraryTableViewModel: LibraryTableViewModel
    
    init(libraryTableViewModel: LibraryTableViewModel) {
        self.libraryTableViewModel = libraryTableViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSLocalizedString("TITLE_VIEW_LIBRARY", comment: "")
        configTableView()
        libraryTableViewModel.changeList = { [weak self] in
            self?.libraryTableView.tableView.reloadData()
        }
    }
    
    override func loadView() {
        view = libraryTableView
    }
    
    func configTableView() {
        libraryTableView.tableView.delegate = self
        libraryTableView.tableView.dataSource = self
        libraryTableView.tableView.registerCell(cellType: LibraryTableViewCell.self)
        libraryTableViewModel.loadSampleLibrarys()
    }
    
}
extension LibraryTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return libraryTableViewModel.library.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LibraryTableViewCell.cellIdentifier, for: indexPath) as? LibraryTableViewCell  else {
            fatalError("The dequeued cell is not an instance of LibraryTableViewCell.")
        }
        cell.setupData(library: libraryTableViewModel.library[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let libraryT = libraryTableViewModel.library[indexPath.row]
        let detailsViewModel = DetailsViewModel(bookDetails: libraryT)
        let detailsViewController = DetailsViewController(detailsViewModel: detailsViewModel)
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
    
}
