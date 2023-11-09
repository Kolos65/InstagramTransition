//
//  LayoutAnchor.swift
//  ClosureLayout
//
//  Created by Foltányi Kolos on 2020. 02. 26..
//  Copyright © 2020. Foltányi Kolos.
//  Licensed under the MIT license, see LICENSE file for more info.
//

import UIKit

public protocol LayoutAnchor {
    func constraint(equalTo anchor: Self, constant: CGFloat) -> NSLayoutConstraint
    func constraint(greaterThanOrEqualTo anchor: Self, constant: CGFloat) -> NSLayoutConstraint
    func constraint(lessThanOrEqualTo anchor: Self, constant: CGFloat) -> NSLayoutConstraint
}

extension NSLayoutAnchor: LayoutAnchor {}
