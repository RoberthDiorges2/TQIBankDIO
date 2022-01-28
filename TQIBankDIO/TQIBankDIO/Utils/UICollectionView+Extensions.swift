//
//  UICollectionView+Extensions.swift
//  TQIBank
//
//  Created by Roberth Diorges on 13/01/22.
//

import UIKit

extension UICollectionView {
    
    func register(_ cell: UICollectionViewCell.Type) {
        let bundle = Bundle(for: cell)
        let nib = UINib(nibName: cell.identifier, bundle: bundle)
        register(nib, forCellWithReuseIdentifier: cell.identifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(of class: T.Type,
                                                 for indexPath: IndexPath,
                                                 configure: @escaping ((T) -> Void) = { _ in }) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath)
        if let typedCell = cell as? T {
            configure(typedCell)
        }
        return cell
    }
}
