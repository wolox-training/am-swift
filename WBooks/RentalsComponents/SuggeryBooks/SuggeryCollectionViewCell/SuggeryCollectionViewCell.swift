//
//  SuggeryCollectionViewCell.swift
//  WBooks
//
//  Created by ana.mancuso on 24/10/2022.
//

import UIKit

class SuggeryCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "SuggeryCollectionViewCell"
    
    @IBOutlet weak var imageBook: UIImageView! {
        didSet {
            imageBook.layer.cornerRadius = 1
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
    }
    
    func setupBookImage(library: Library?) {
        imageBook?.downloaded(from: library?.photo ?? "")
    }
    
}
