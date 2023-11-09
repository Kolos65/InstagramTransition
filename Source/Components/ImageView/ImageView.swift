//
//  ImageView.swift
//  InstagramTransition
//
//  Created by Kolos Foltanyi on 2023. 07. 22..
//

import UIKit

class ImageView: UIImageView {

    // MARK: Inner types

    enum ImageDownloadError: Error {
        case badURL
        case invalidData
    }

    // MARK: Private properties

    private var imageTask: Task<Void, Error>?
    private var defaultImageCache: ImageCache { ImageMemoryCache.shared }

    // MARK: Methods

    func setImage(from urlString: String,
                  with placeholder: UIImage? = nil,
                  using imageCache: ImageCache? = nil) {
        imageTask?.cancel()
        imageTask = Task {
            try await setImageAsync(from: urlString, with: placeholder, using: imageCache)
        }
    }

    func setImage(from url: URL,
                  with placeholder: UIImage? = nil,
                  using imageCache: ImageCache? = nil) {
        imageTask?.cancel()
        imageTask = Task {
            try await setImageAsync(from: url, with: placeholder, using: imageCache)
        }
    }

    func setRemoteImage(from url: URL, saveTo imageCache: ImageCache? = nil) {
        imageTask?.cancel()
        imageTask = Task {
            try await setRemoteImageAsync(from: url, saveTo: imageCache)
        }
    }
}

// MARK: - Helpers

extension ImageView {
    private func setImageAsync(from urlString: String,
                               with placeholder: UIImage? = nil,
                               using imageCache: ImageCache? = nil) async throws {
        guard let url = URL(string: urlString) else {
            throw ImageDownloadError.badURL
        }
        try await setImageAsync(from: url, with: placeholder, using: imageCache)
    }

    private func setImageAsync(from url: URL,
                               with placeholder: UIImage? = nil,
                               using imageCache: ImageCache? = nil) async throws {
        setImage(placeholder)
        let imageCache = imageCache ?? defaultImageCache
        if let cachedImage = imageCache.getImage(forKey: url) {
            try Task.checkCancellation()
            setImage(cachedImage)
            return
        }
        try await setRemoteImageAsync(from: url, saveTo: imageCache)
    }

    private func setRemoteImageAsync(from url: URL, saveTo imageCache: ImageCache? = nil) async throws {
        let request = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let image = UIImage(data: data) else {
            throw ImageDownloadError.invalidData
        }
        imageCache?.setImage(image, forKey: response.url ?? url)
        try Task.checkCancellation()
        setImage(image)
    }

    @MainActor
    private func setImage(_ image: UIImage?) {
        self.image = image
    }
}
