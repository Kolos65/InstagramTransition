//
//  ImageHeader.swift
//  InstagramTransition
//
//  Created by Kolos Foltanyi on 2023. 07. 22..
//

import UIKit

class ImageHeader: UIView {

    // MARK: Private properties

    private let stackView = UIStackView()
    private let profileImageView = UIImageView()
    private let titleStackView = UIStackView()
    private let userNameLabel = UILabel()
    private let locationLabel = UILabel()
    private let moreIconView = UIImageView()


    // MARK: Init

    init(userName: String, location: String) {
        super.init(frame: .zero)
        setupUI()
        userNameLabel.text = userName
        locationLabel.text = location
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

extension ImageHeader {
    private func setupUI() {
        setupStackView()
        setupProfileImageView()
        setupTitleStackView()
        setupUserNameLabel()
        setupLocationLabel()
        setupMoreIconView()
    }

    private func setupStackView() {
        stackView.do {
            addSubview($0)
            fillWith($0, insets: .init(top: 0, left: 8, bottom: 0, right: 16))
            $0.axis = .horizontal
            $0.alignment = .center
        }
    }

    private func setupProfileImageView() {
        profileImageView.then {
            stackView.addArrangedSubview($0)
            stackView.setCustomSpacing(8, after: $0)
            $0.image = UIImage(systemName: "person.circle.fill")
            $0.contentMode = .scaleAspectFit
            $0.tintColor = .black
        }.layout {
            $0.size == CGSize(width: 40, height: 40)
        }
    }

    private func setupTitleStackView() {
        titleStackView.do {
            stackView.addArrangedSubview($0)
            $0.axis = .vertical
            $0.alignment = .leading
        }
    }

    private func setupUserNameLabel() {
        userNameLabel.do {
            titleStackView.addArrangedSubview($0)
            $0.font = .systemFont(ofSize: 16, weight: .semibold)
        }
    }

    private func setupLocationLabel() {
        locationLabel.do {
            titleStackView.addArrangedSubview($0)
            $0.font = .systemFont(ofSize: 14, weight: .regular)
        }
    }

    private func setupMoreIconView() {
        moreIconView.then {
            $0.contentMode = .scaleAspectFit
            $0.image = UIImage(systemName: "ellipsis")
            $0.tintColor = .black
            stackView.addArrangedSubview($0)
        }.layout {
            $0.size == CGSize(width: 22, height: 22)
        }
    }
}
