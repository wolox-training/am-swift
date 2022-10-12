//
//  UITableViewExtension.swift
//  WBooks
//
//  Created by ana.mancuso on 28/09/2022.
//
import UIKit

protocol IdentifiableCell {
    
  static var cellIdentifier: String { get }
    
}

extension UITableViewCell: IdentifiableCell {
    
  static var cellIdentifier: String { return String(describing: self) }
    
}

extension UITableView {
    
  func registerCell(cellType: IdentifiableCell.Type) {
      register(UINib(nibName: cellType.cellIdentifier, bundle: nil), forCellReuseIdentifier: cellType.cellIdentifier)
  }
    
}
