//
//  LayoutClosure.swift
//  ClosureLayout
//
//  Created by Foltányi Kolos on 2020. 02. 26..
//  Copyright © 2020. Foltányi Kolos.
//  Licensed under the MIT license, see LICENSE file for more info.
//

import UIKit

extension UIView {
    public func layout(using closure: (LayoutProxy) -> Void) {
        translatesAutoresizingMaskIntoConstraints = false
        closure(LayoutProxy(view: self))
    }
}
