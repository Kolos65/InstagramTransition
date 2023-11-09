//
//  CGAffineTransform+Extensions.swift
//  InstagramTransition
//
//  Created by Kolos Foltanyi on 2023. 07. 22..
//

import UIKit

extension CGAffineTransform {
    static func transform(from frameA: CGRect, to frameB: CGRect) -> Self {
        let scale = scale(from: frameA, to: frameB)
        let translation = translate(from: frameA, to: frameB)
        return scale.concatenating(translation)
    }

    static func translate(from frameA: CGRect, to frameB: CGRect) -> Self {
        let centerA = CGPoint(x: frameA.midX, y: frameA.midY)
        let centerB = CGPoint(x: frameB.midX, y: frameB.midY)
        return CGAffineTransform(
            translationX: centerB.x - centerA.x,
            y: centerB.y - centerA.y
        )
    }

    static func scale(from frameA: CGRect, to frameB: CGRect) -> Self {
        let scaleX = frameB.width / frameA.width
        let scaleY = frameB.height / frameA.height
        return CGAffineTransform(scaleX: scaleX, y: scaleY)
    }

    static func transform(parent: CGRect, soChild child: CGRect, matches rect: CGRect) -> Self {
        let scaleX = rect.width / child.width
        let scaleY = rect.height / child.height

        let offsetX = rect.midX - parent.midX
        let offsetY = rect.midY - parent.midY
        let centerOffsetX = (parent.midX - child.midX) * scaleX
        let centerOffsetY = (parent.midY - child.midY) * scaleY

        let translateX = offsetX + centerOffsetX
        let translateY = offsetY + centerOffsetY

        let scaleTransform = CGAffineTransform(scaleX: scaleX, y: scaleY)
        let translateTransform = CGAffineTransform(translationX: translateX, y: translateY)

        return scaleTransform.concatenating(translateTransform)
    }

    static func transform(parent: CGRect, soChild child: CGRect, aspectFills rect: CGRect) -> Self {
        let childRatio = child.width / child.height
        let rectRatio = rect.width / rect.height

        let scaleX = rect.width / child.width
        let scaleY = rect.height / child.height

        let scaleFactor = rectRatio < childRatio ? scaleY : scaleX

        let offsetX = rect.midX - parent.midX
        let offsetY = rect.midY - parent.midY
        let centerOffsetX = (parent.midX - child.midX) * scaleFactor
        let centerOffsetY = (parent.midY - child.midY) * scaleFactor

        let translateX = offsetX + centerOffsetX
        let translateY = offsetY + centerOffsetY

        let scaleTransform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
        let translateTransform = CGAffineTransform(translationX: translateX, y: translateY)

        return scaleTransform.concatenating(translateTransform)
    }
}
