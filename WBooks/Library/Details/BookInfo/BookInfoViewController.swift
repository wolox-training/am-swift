//
//  BookInfoViewController.swift
//  WBooks
//
//  Created by ana.mancuso on 17/10/2022.
//

import UIKit

class BookInfoViewController: UIViewController {
    
    //MARK: Properties
    
    private lazy var bookView = BookInfoView()
    private let bookViewModel: BookInfoViewModel
    
    //MARK: Initialization
    
    init (bookViewModel: BookInfoViewModel) {
        self.bookViewModel = bookViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init? (coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configBook()
    }
    
    override func loadView() {
        view = bookView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        bookView.rentButton.applyGradient(colors: (bookViewModel.isAvailable() ? [UIColor.lightSeaGreen.cgColor, UIColor.summerSky.cgColor,  UIColor.mediumTurquoise.cgColor] : [UIColor.gainsboro.cgColor, UIColor.gainsboro.cgColor, UIColor.gainsboro.cgColor]), textColor: .white)
    }
    func configBook() {
        setupData(library: bookViewModel.bookDetails)
        bookView.availabilityBook.textColor = bookViewModel.isAvailable() ? .sushi : .persianRed
        bookView.rentButton.addTarget(self, action:#selector(rentButton), for: .touchUpInside)
        bookView.addButton.addTarget(self, action:#selector(addButton), for: .touchUpInside)
    }
    
    //MARK: Action
    
    @objc func addButton() {
        print("hola")
    }
    @objc func rentButton(sender: UIButton) {
        alertConfiguration()
        bookViewModel.rentLibrary()
    }
    
    func alertConfiguration () {
        let title = NSLocalizedString("ALERT_BOOKED_SUCCESSFULLY", comment: "")
        let succesTitle = NSLocalizedString("COMMENT_BOOKED_SUCCESFULLY", comment: "")
        let errorTitle = NSLocalizedString("COMMENT_BOOKED_ERROR", comment: "")
        let noRentTitle = NSLocalizedString("COMMENT_BOOKED_NO_RENT", comment: "")
        let noti = UIAlertController(title: title, message: succesTitle.capitalized, preferredStyle: .alert)
        let alert = UIAlertController(title: "OH NO!", message: noRentTitle.capitalized, preferredStyle: .alert)
        let error = UIAlertController(title: "ERROR", message: errorTitle.capitalized, preferredStyle: .alert)
        
        if bookViewModel.isAvailable() {
            noti.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(noti, animated: true, completion: nil)
        } else {
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
        }
/*       else {
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(error, animated: true, completion: nil)
        }*/
    }
    
    func setupData(library: Library?) {
        bookView.bookName.text = library?.name
        bookView.authorBook.text = library?.name2
        bookView.availabilityBook.text = library?.status
        bookView.yearBook.text = library?.year
        bookView.genreBook.text = library?.genre
        bookView.bookImage?.downloaded(from: library?.photo ?? "")
    }
}
