//
//  SuggeryBooksViewController.swift
//  WBooks
//
//  Created by ana.mancuso on 22/10/2022.
//

import UIKit

class SuggeryBooksViewController: UIViewController {

    
    
    private lazy var suggeryBooksView = SuggeryBooksView()
    private let suggeryBooksViewModel: SuggeryBooksViewModel
    
    init(suggeryBooksViewModel: SuggeryBooksViewModel) {
        self.suggeryBooksViewModel = suggeryBooksViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionViewCell()
    }
    
    override func loadView() {
        view = suggeryBooksView
    }
    
    func configCollectionViewCell() {
        suggeryBooksView.collectionBooks.delegate = self
        suggeryBooksView.collectionBooks.dataSource = self
        suggeryBooksViewModel.loadSampleLibrarys {
            self.suggeryBooksView.collectionBooks.reloadData()
        }
    }

}
extension SuggeryBooksViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return suggeryBooksViewModel.library.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SuggeryCollectionViewCell.cellIdentifier, for: indexPath) as! SuggeryCollectionViewCell
    
        cell.setupBookImage(library: suggeryBooksViewModel.library[indexPath.row])
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 48.0, height: 70.0)
    }
    
}
