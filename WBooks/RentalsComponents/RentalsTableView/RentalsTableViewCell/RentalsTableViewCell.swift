//
//  RentalsTableViewCell.swift
//  WBooks
//
//  Created by ana.mancuso on 24/10/2022.
//

import UIKit

class RentalsTableViewCell: UITableViewCell {
    
    //    MARK: Properties
    
    let cellIdentifier = "RentalsTableViewCell"
    
    @IBOutlet weak var rentsView: UIView! {
        didSet {
           cornerAndShadow(view: rentsView)
        }
    }
    @IBOutlet weak var titleBook: UILabel!
    @IBOutlet weak var imageBook: UIImageView!
    @IBOutlet weak var authorBook: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupRentsBooks(rents: Rents?) {
        titleBook.text = rents?.book.name
        authorBook.text = rents?.book.name2
        imageBook?.downloaded(from: rents?.book.photo ?? "")
    }
    
}
