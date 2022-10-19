//
//  AddNewController.swift
//  WBooks
//
//  Created by ana.mancuso on 28/09/2022.
//

import UIKit

class AddNewController: UIViewController {
    
    private lazy var addNewView = AddNewView()
    private let addNewViewModel: AddNewViewModel
    let imagePickerController = UIImagePickerController()
    
    init(addNewViewModel: AddNewViewModel) {
        self.addNewViewModel = addNewViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSLocalizedString("TITLE_VIEW_DETAILS", comment: "")
        addNewView.submitButton.addTarget(self, action: #selector(submitButton), for: .touchUpInside)
        addNewView.addButtonImage.addTarget(self, action: #selector(selectImage), for: .touchUpInside)
        addNewView.yearBook.delegate = self
    }
    
    override func loadView() {
        view = addNewView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        addNewView.submitButton.applyGradient(colors: [UIColor.lightSeaGreen.cgColor, UIColor.summerSky.cgColor,  UIColor.mediumTurquoise.cgColor],
                                              textColor: UIColor.white)
    }
    
    @objc func selectImage() {
        let alertController = UIAlertController(title: .none, message: .none, preferredStyle: .actionSheet)
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        let chooseAction = UIAlertAction(title: String(localized: "ALERT_GALLERY"), style: .default) { _ in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: .none)
        }
        alertController.addAction(chooseAction)
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let takeAction = UIAlertAction(title: String(localized: "ALERT_CAMERA"), style: .default) { _ in
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: .none)
            }
            alertController.addAction(takeAction)
        }
        let cancelAction = UIAlertAction(title: String(localized: "ALERT_CANCEL"), style: .cancel, handler: .none)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    //MARK: Action
    
    @objc func submitButton() {
        
    }
    
}
extension AddNewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        addNewView.addImage.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
}
extension AddNewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        switch textField {
        case addNewView.titleBook:
            break
        case addNewView.authorBook:
            break
        case addNewView.yearBook:
            break
        case addNewView.descriptionBook:
            break
        case addNewView.genreBook:
            break
        default:
            break
        }
        return true
    }
    
}
