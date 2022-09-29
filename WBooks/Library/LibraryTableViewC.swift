//
//  LibraryTableViewC.swift
//  WBooks
//
//  Created by ana.mancuso on 27/09/2022.
//

import UIKit

class LibraryTableViewC: UIViewController {
        
    private lazy var libraryViewC = LibraryTableView()
    private let libraryTableViewModel: LibraryTableViewModel
    
    init(viewModel: LibraryTableViewModel) {
        self.libraryTableViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.topItem?.title = NSLocalizedString("TITLE_VIEW_LIBRARY", comment: "")
        configTableView()
    }
    
    override func loadView() {
        view = libraryViewC
    }
         
    func configTableView() {
        libraryViewC.tableView.delegate = self
        libraryViewC.tableView.dataSource = self
        libraryViewC.tableView.registerCell(cellType: LibraryTableViewCell.self)
        libraryTableViewModel.loadSampleLibrarys()
    }
        
}
extension LibraryTableViewC: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return libraryTableViewModel.library.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "LibraryTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? LibraryTableViewCell  else {
            fatalError("The dequeued cell is not an instance of LibraryTableViewCell.")
        }
        cell.setupData(library: libraryTableViewModel.library[indexPath.row])

        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

}

