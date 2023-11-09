//
//  Picture.swift
//  InstagramTransition
//
//  Created by Kolos Foltanyi on 2023. 07. 22..
//

import Foundation

struct Picture: Hashable {
    let id = UUID()
    let title: String
    let imageURL: URL

    static var random: Picture {
        list.randomElement()!
    }

    static var list: [Picture] {
        Images.urls.enumerated().map { index, url in
            Picture(title: "image \(index + 1)", imageURL: url)
        }
    }
}
