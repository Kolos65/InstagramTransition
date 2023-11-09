//
//  ProfileHeader.swift
//  InstagramTransition
//
//  Created by Kolos Foltanyi on 2023. 07. 22..
//

import UIKit

class ProfileHeader: UIView {

    // MARK: Private properties

    private let profileIconView = UIImageView()
    private let titleLabel = UILabel()
    private let addIconView = UIImageView()
    private let moreIconView = UIImageView()
    private let stackView = UIStackView()

    // MARK: Init

    init(title: String) {
        super.init(frame: .zero)
        setupUI()
        titleLabel.text = title
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup

extension ProfileHeader {
    private func setupUI() {
        setupStackView()
        setupProfileIconView()
        setupTitleLabel()
        setupAddIconView()
        setupMoreIconView()
    }

    private func setupStackView() {
        stackView.do {
            addSubview($0)
            fillWith($0, insets: .init(top: 0, left: 8, bottom: 16, right: 8))
            $0.axis = .horizontal
            $0.alignment = .center
        }
    }

    private func setupProfileIconView() {
        profileIconView.do {
            setupImageView($0, with: "person.crop.circle", size: 20)
            stackView.addArrangedSubview($0)
            stackView.setCustomSpacing(4, after: $0)
        }
    }

    private func setupTitleLabel() {
        titleLabel.do {
            $0.font = .systemFont(ofSize: 28, weight: .semibold)
            stackView.addArrangedSubview($0)
            $0.setContentHuggingPriority(.required, for: .horizontal)
        }
    }

    private func setupAddIconView() {
        addIconView.do {
            setupImageView($0, with: "plus.app", size: 30)
            stackView.addArrangedSubview($0)
            stackView.setCustomSpacing(8, after: $0)
        }
    }

    private func setupMoreIconView() {
        moreIconView.do {
            setupImageView($0, with: "line.3.horizontal.circle", size: 30)
            stackView.addArrangedSubview($0)
        }
    }

    private func setupImageView(_ imageView: UIImageView, with imageName: String, size: CGFloat) {
        imageView.then {
            $0.contentMode = .scaleAspectFit
            let configuration = UIImage.SymbolConfiguration.init(weight: .medium)
            $0.image = UIImage(systemName: imageName, withConfiguration: configuration)
            $0.tintColor = .black
        }.layout {
            $0.size == CGSize(width: size, height: size)
        }
    }
}
