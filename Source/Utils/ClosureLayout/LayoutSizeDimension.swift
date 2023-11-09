//
//  LayoutSizeDimension.swift
//  ClosureLayout
//
//  Created by Foltányi Kolos on 2020. 02. 26..
//  Copyright © 2020. Foltányi Kolos.
//  Licensed under the MIT license, see LICENSE file for more info.
//

import UIKit

public protocol LayoutSizeDimension {
    func constraint(equalToConstant c: CGSize) -> (height: NSLayoutConstraint, width: NSLayoutConstraint)
}

public struct LayoutSizeDimensionAnchor: LayoutSizeDimension {
    let heightAnchor: NSLayoutDimension
    let widthAnchor: NSLayoutDimension
    
    public func constraint(equalToConstant c: CGSize) -> (height: NSLayoutConstraint, width: NSLayoutConstraint) {
        return (
            height: heightAnchor.constraint(equalToConstant: c.height),
            width: widthAnchor.constraint(equalToConstant: c.width)
        )
    }
}
