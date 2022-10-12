//
//  LibraryTableViewCell.swift
//  WBooks
//
//  Created by ana.mancuso on 20/09/2022.
//

import UIKit

class LibraryTableViewCell: UITableViewCell {

//    MARK: Properties
    @IBOutlet weak var libraryView: UIView!
    @IBOutlet weak var nameBookLabel: UILabel!
    @IBOutlet weak var photoBookView: UIImageView!
    @IBOutlet weak var autorBookName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        libraryView.layer.cornerRadius = 10
        libraryView.layer.shadowColor = UIColor.darkGray.cgColor
        libraryView.layer.shadowRadius = 3
        libraryView.layer.shadowOpacity = 0.2
        libraryView.layer.shadowOffset = CGSize(width: 0.0, height: 0.1)
        libraryView.layer.masksToBounds = false
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setupData(library: Library?) {
        nameBookLabel.text = library?.name
        autorBookName.text = library?.name2
        imageFromUrl(urlString: library?.photo ?? "")
    }
    
    func imageFromUrl(urlString: String) {
            if let url = URL(string: (urlString.contains("https")) ? urlString : urlString.replacingOccurrences(of: "http", with: "https")) {
                let task = URLSession.shared.dataTask(with: url) { data, response, error in
                    guard let data = data, error == nil else {
                        DispatchQueue.main.async {
                            self.photoBookView.image = UIImage(named: "Cover1")
                        }
                        return
                    }
                    DispatchQueue.main.async {
                        self.photoBookView.image = UIImage(data: data)
                    }
                }
                task.resume()
            }
        }
}
