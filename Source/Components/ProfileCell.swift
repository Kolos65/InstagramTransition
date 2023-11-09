//
//  ProfileCell.swift
//  InstagramTransition
//
//  Created by Kolos Foltanyi on 2023. 07. 22..
//

import UIKit

class ProfileCell: UICollectionViewCell {

    // MARK: UI Properties

    private let imageView = ImageView()

    // MARK: Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Data

    func setup(with picture: Picture) {
        imageView.setImage(from: picture.imageURL)
    }
}

// MARK: - Reuse

extension ProfileCell {
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
}

// MARK: - Setup

extension ProfileCell {
    private func setupUI() {
        setupImageView()
    }

    private func setupImageView() {
        imageView.do {
            $0.contentMode = .scaleAspectFill
            $0.layer.masksToBounds = true
            contentView.addSubview($0)
            contentView.fillWith($0)
        }
    }
}

