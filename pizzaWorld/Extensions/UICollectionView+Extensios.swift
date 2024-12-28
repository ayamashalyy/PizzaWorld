//
//  UICollectionView+Extensios.swift
//  pizzaWorld
//
//  Created by aya on 27/12/2024.
//

import Foundation
import UIKit

extension UICollectionView {
    
    func registerCell<Cell: UICollectionViewCell>(cellClass: Cell.Type) {
        self.register(UINib(nibName: String(describing: Cell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: Cell.self))
    }
    
    func dequeue<Cell: UICollectionViewCell>(indexPath: IndexPath) -> Cell{
        let indentifier = String(describing: Cell.self)
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: indentifier, for: indexPath) as? Cell else {
            fatalError("Error in cell")
        }
        return cell
    }
}
