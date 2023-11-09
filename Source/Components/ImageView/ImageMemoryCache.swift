//
//  ImageMemoryCache.swift
//  InstagramTransition
//
//  Created by Kolos Foltanyi on 2023. 07. 22..
//

import UIKit

class ImageMemoryCache {

    // MARK: Constants

    private enum Constants {
        static let countLimit = 100
    }

    // MARK: Init

    init() { storage.countLimit = Constants.countLimit }

    // MARK: Private properties

    private let storage = NSCache<NSString, UIImage>()
    private func storageKey(from url: URL) -> NSString { NSString(string: url.absoluteString) }

    // MARK: Static properties

    private static var instance: ImageCache?
    static var shared: ImageCache {
        guard let instance else {
            let instance = ImageMemoryCache()
            self.instance = instance
            return instance
        }
        return instance
    }
}

// MARK: - ImageCache

extension ImageMemoryCache: ImageCache {
    public func setImage(_ image: UIImage, forKey key: URL) {
        storage.setObject(image, forKey: storageKey(from: key))
    }

    public func getImage(forKey key: URL) -> UIImage? {
        storage.object(forKey: storageKey(from: key))
    }

    public func removeImage(forKey key: URL) {
        storage.removeObject(forKey: storageKey(from: key))
    }

    public func purge() {
        storage.removeAllObjects()
    }
}
