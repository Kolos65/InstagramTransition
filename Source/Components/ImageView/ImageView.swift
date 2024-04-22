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

    func setImage(from url: URL,
                  with placeholder: UIImage? = nil,
                  using imageCache: ImageCache? = nil) {
        imageTask?.cancel()
        setImage(placeholder)
        let imageCache = imageCache ?? defaultImageCache
        if let cachedImage = imageCache.getImage(forKey: url) {
            setImage(cachedImage)
            return
        }
        imageTask = Task {
            try await setRemoteImageAsync(from: url, saveTo: imageCache)
        }
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
