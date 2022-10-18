//
//  AddNewController.swift
//  WBooks
//
//  Created by ana.mancuso on 28/09/2022.
//

import UIKit

class AddNewController: UIViewController {
    
    private lazy var addnewView = AddNewView()
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
        addnewView.submitButton.addTarget(self, action:#selector(submitButton), for: .touchUpInside)
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
    }
    
    override func loadView() {
        view = addnewView
    }
    
    //MARK: Action
    
    @objc func submitButton() {
    }
    @IBAction func selectBookImage(_ sender: UITapGestureRecognizer) {
        present(imagePickerController, animated: true, completion: nil)
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
        addnewView.addImage.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
}
