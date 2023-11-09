//
//  SharedTransitioning.swift
//  InstagramTransition
//
//  Created by Kolos Foltanyi on 2023. 07. 23..
//

import UIKit

protocol SharedTransitioning {
    var sharedFrame: CGRect { get }
    var config: SharedTransitionConfig? { get }
    func prepare(for transition: SharedTransitionAnimator.Transition)
}

extension SharedTransitioning {
    func prepare(for transition: SharedTransitionAnimator.Transition) {}
    var config: SharedTransitionConfig? { nil }
}

extension UIViewControllerContextTransitioning {
    func sharedFrame(forKey key: UITransitionContextViewControllerKey) -> CGRect? {
        let viewController = viewController(forKey: key)
        viewController?.view.layoutIfNeeded()
        return (viewController as? SharedTransitioning)?.sharedFrame
    }
}
