//
//  UIApplication+KeyWindow.swift
//  InstagramTransition
//
//  Created by Kolos Foltanyi on 2023. 07. 22..
//

import UIKit

extension UIApplication {
    static var keyWindow: UIWindow? {
        UIApplication.shared
            .connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }
    }
}
