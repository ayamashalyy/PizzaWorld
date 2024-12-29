//
//  UITableView+Extensions.swift
//  pizzaWorld
//
//  Created by aya on 30/12/2024.
//

import Foundation
import UIKit

extension UITableView {
    
    func registerCell<Cell: UITableViewCell>(cellClass: Cell.Type) {
        func registerCell<Cell: UITableViewCell>(cellClass: Cell.Type) {
            self.register(UINib(nibName: String(describing: Cell.self), bundle: nil), forCellReuseIdentifier: String(describing: Cell.self))
        }
    }
    
    func dequeue<Cell: UITableViewCell>(indexPath: IndexPath) -> Cell{
        let indentifier = String(describing: Cell.self)
        guard let cell = self.dequeueReusableCell(withIdentifier: indentifier) as? Cell else {
            fatalError("Error in cell")
        }
        return cell
    }
}
