//
//  SharedTransitionConfig.swift
//  InstagramTransition
//
//  Created by Kolos Foltanyi on 2023. 07. 24..
//

import UIKit

public struct SharedTransitionConfig {
    var duration: CGFloat
    var curve: CAMediaTimingFunction
    var maskCornerRadius: CGFloat
    var overlayOpacity: Float
    var interactionScaleFactor: CGFloat = .zero
    var placeholderColor: UIColor
}

extension SharedTransitionConfig {
    static var `default`: SharedTransitionConfig {
        .init(
            duration: 0.25,
            curve: CAMediaTimingFunction(controlPoints: 0.5, 0, 0.6, 1),
            maskCornerRadius: 39,
            overlayOpacity: 0.5,
            placeholderColor: .white
        )
    }

    static var interactive: SharedTransitionConfig {
        .init(
            duration: 0.25,
            curve: CAMediaTimingFunction(controlPoints: 0.57, 0.27, 0.21, 0.97),
            maskCornerRadius: 39,
            overlayOpacity: 0.5,
            interactionScaleFactor: 0.6,
            placeholderColor: .white
        )
    }
}
