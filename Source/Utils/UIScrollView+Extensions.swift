//
//  UIScrollView+Extensions.swift
//  InstagramTransition
//
//  Created by Kolos Foltanyi on 2023. 07. 24..
//

import UIKit

extension UIScrollView {
    var isBouncing: Bool {
        contentOffset.y < 0 || contentOffset.y > (contentSize.height - frame.size.height)
    }
}
