//
//  ImageCache.swift
//  InstagramTransition
//
//  Created by Kolos Foltanyi on 2023. 07. 22..
//

import UIKit

protocol ImageCache {
    func getImage(forKey key: URL) -> UIImage?
    func setImage(_ image: UIImage, forKey key: URL)
    func removeImage(forKey key: URL)
    func purge()
}
