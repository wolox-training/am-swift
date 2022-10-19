//
//  UIViewExtension.swift
//  WBooks
//
//  Created by ana.mancuso on 17/10/2022.
//

import UIKit

extension UIView {
    
    func addSubViewWithConstraints(child: UIView, parent: UIView) {
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.topAnchor.constraint(equalTo: parent.topAnchor),
            child.bottomAnchor.constraint(equalTo: parent.bottomAnchor),
            child.leadingAnchor.constraint(equalTo: parent.leadingAnchor),
            child.trailingAnchor.constraint(equalTo: parent.trailingAnchor)
        ])
    }
    func cornerAndShadow(view: UIView) {
        view.layer.cornerRadius = 10
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.darkGray.cgColor
        view.layer.shadowRadius = 3
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = CGSize(width: 0.0, height: 0.1)
        view.layer.masksToBounds = false
    }
    
    func editLines(object: UIView) {
        object.heightAnchor.constraint(equalToConstant: 0.8).isActive = true
        object.backgroundColor = .gainsboro
    }
    
    func editTexts(object: UITextField) {
        object.textColor = .gainsboro
        object.font = UIFont.italicSystemFont(ofSize: 16)
        object.layer.borderColor = .none
    }
    
}
