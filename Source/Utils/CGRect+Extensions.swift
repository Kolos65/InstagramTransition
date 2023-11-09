//
//  CGRect+Extensions.swift
//  InstagramTransition
//
//  Created by Kolos Foltanyi on 2023. 07. 24..
//

import UIKit

extension CGRect {
    func aspectFit(to frame: CGRect) -> CGRect {
        let ratio = width / height
        let frameRatio = frame.width / frame.height
        if frameRatio < ratio {
            return aspectFitWidth(to: frame)
        } else {
            return aspectFitHeight(to: frame)
        }
    }

    func aspectFitWidth(to frame: CGRect) -> CGRect {
        let ratio = width / height
        let height = frame.width * ratio
        let offsetY = (frame.height - height) / 2
        let origin = CGPoint(x: frame.origin.x, y: frame.origin.y + offsetY)
        let size = CGSize(width: frame.width, height: height)
        return CGRect(origin: origin, size: size)
    }

    func aspectFitHeight(to frame: CGRect) -> CGRect {
        let ratio = height / width
        let width = frame.height * ratio
        let offsetX = (frame.width - width) / 2
        let origin = CGPoint(x: frame.origin.x + offsetX, y: frame.origin.y)
        let size = CGSize(width: width, height: frame.height)
        return CGRect(origin: origin, size: size)
    }
}
