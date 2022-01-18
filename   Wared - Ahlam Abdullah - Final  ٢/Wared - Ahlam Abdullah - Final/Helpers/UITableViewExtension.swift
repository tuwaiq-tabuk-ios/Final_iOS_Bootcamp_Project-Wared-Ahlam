//
//  UITableViewExtension.swift
//  Wared - Ahlam Abdullah - Final
//
//  Created by ahlam  on 26/05/1443 AH.
//

import Foundation
import UIKit

extension UITableView {
  
  func registerHeaderNib<Cell: UITableViewHeaderFooterView>(cellClass: Cell.Type) {
    self.register(UINib(nibName: String(describing: Cell.self), bundle: nil), forHeaderFooterViewReuseIdentifier: String(describing: Cell.self))
  }
  
  
  func registerCellNib<Cell: UITableViewCell>(cellClass: Cell.Type) {
    self.register(UINib(nibName: String(describing: Cell.self), bundle: nil), forCellReuseIdentifier: String(describing: Cell.self))
  }
  
  
  func dequeue<Cell: UITableViewCell>() -> Cell {
    let identifier = String(describing: Cell.self)
    
    guard let cell = self.dequeueReusableCell(withIdentifier: identifier) as? Cell else {
      fatalError("Error in cell")
    }
    return cell
  }
}
