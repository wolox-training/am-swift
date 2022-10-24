//
//  SuggeryBooksView.swift
//  WBooks
//
//  Created by ana.mancuso on 22/10/2022.
//

import UIKit

final class SuggeryBooksView: NibView {
    
    @IBOutlet weak var suggeryTitle: UILabel! {
        didSet {
            suggeryTitle.text = String(localized: "SUGGERY_TITLE").capitalized
            suggeryTitle.font = .boldSystemFont(ofSize: 18)
        }
    }
    @IBOutlet var suggeryView: UIView! {
        didSet {
            suggeryView.backgroundColor = .clear
        }
    }
    @IBOutlet weak var collectionBooks: UICollectionView! {
        didSet {
            collectionBooks.backgroundColor = .clear
            let nib = UINib(nibName: "SuggeryCollectionViewCell", bundle: nil)
            collectionBooks.register(nib, forCellWithReuseIdentifier: "SuggeryCollectionViewCell")
        }
    }
    
}
