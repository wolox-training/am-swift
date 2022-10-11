//
//  DetailsView.swift
//  WBooks
//
//  Created by ana.mancuso on 30/09/2022.
//

import UIKit

final class DetailsView: NibView {
    
//MARK: Properties
    @IBOutlet var bookImage: UIImageView!
    @IBOutlet var bookName: UILabel!
    @IBOutlet var availabilityBook: UILabel!
    @IBOutlet var authorBook: UILabel!
    @IBOutlet var yearBook: UILabel!
    @IBOutlet var genreBook: UILabel!
    
    
//    MARK: Action
    @IBAction func addButton(_ sender: UIButton) {
    }
    
    @IBAction func rentButton(_ sender: UIButton) {
    }
    
    func setupData(library: Library?) {
        bookName.text = library?.name
        authorBook.text = library?.name2
        availabilityBook.text = (library?.id ?? 0 > 0) ? "Available" : "Unavailable"
        yearBook.text = library?.year
        genreBook.text = library?.genre
        imageFromUrl(urlString: library?.photo ?? "")
    }
    func imageFromUrl(urlString: String) {
            if let url = URL(string: (urlString.contains("https")) ? urlString : urlString.replacingOccurrences(of: "http", with: "https")) {
                let task = URLSession.shared.dataTask(with: url) { data, response, error in
                    guard let data = data, error == nil else {
                        DispatchQueue.main.async {
                            self.bookImage.image = UIImage(named: "Cover1")
                        }
                        return
                    }
                    DispatchQueue.main.async {
                        self.bookImage.image = UIImage(data: data)
                    }
                }
                task.resume()
            }
        }
    
}

