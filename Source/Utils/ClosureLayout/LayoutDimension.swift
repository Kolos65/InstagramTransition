//
//  LayoutDimension.swift
//  ClosureLayout
//
//  Created by Foltányi Kolos on 2020. 02. 26..
//  Copyright © 2020. Foltányi Kolos.
//  Licensed under the MIT license, see LICENSE file for more info.
//

import UIKit

public protocol LayoutDimension {
    func constraint(equalToConstant c: CGFloat) -> NSLayoutConstraint
    func constraint(lessThanOrEqualToConstant: CGFloat) -> NSLayoutConstraint
    func constraint(greaterThanOrEqualToConstant: CGFloat) -> NSLayoutConstraint
}

extension NSLayoutDimension: LayoutDimension {}
