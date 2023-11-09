//
//  UICellReuse+Extensions.swift
//  InstagramTransition
//
//  Created by Kolos Foltanyi on 2023. 07. 22..
//

import UIKit

extension UITableView {
    func dequeuCellOfType<Cell: UITableViewCell>(_ type: Cell.Type, id: String? = nil) -> Cell {
        let reuseIdentifier = id ?? Cell.identifier
        guard let cell = dequeueReusableCell(withIdentifier: reuseIdentifier) as? Cell else {
            fatalError("Could not dequeue cell with identifier: \(reuseIdentifier)")
        }
        return cell
    }

    func register<Cell: UITableViewCell>(_ type: Cell.Type) {
        register(type, forCellReuseIdentifier: Cell.identifier)
    }
}

extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UICollectionView {
    func dequeuCellOfType<Cell: UICollectionViewCell>(_ type: Cell.Type,
                                                      id: String? = nil,
                                                      for indexPath: IndexPath) -> Cell {
        let reuseIdentifier = id ?? Cell.identifier
        guard let cell = dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? Cell else {
            fatalError("Could not dequeue cell with identifier: \(reuseIdentifier)")
        }
        return cell
    }

    func register<Cell: UICollectionViewCell>(_ type: Cell.Type) {
        register(type, forCellWithReuseIdentifier: Cell.identifier)
    }
}

extension UICollectionReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}
