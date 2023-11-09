//
//  ImageFooter.swift
//  InstagramTransition
//
//  Created by Kolos Foltanyi on 2023. 07. 22..
//

import UIKit

class ImageFooter: UIView {

    // MARK: Private properties

    private let stackView = UIStackView()
    private let heartIconView = UIImageView()
    private let messageIconView = UIImageView()
    private let sendIconView = UIImageView()
    private let bookMarkIconView = UIImageView()
    private let dateLabel = UILabel()

    // MARK: Init

    init(date: String) {
        super.init(frame: .zero)
        dateLabel.text = date
        setupUI()
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

extension ImageFooter {
    private func setupUI() {
        setupStackView()
        addIcon("heart", imageView: heartIconView)
        addIcon("message", imageView: messageIconView)
        addIcon("paperplane", imageView: sendIconView)
        setupBookMarkIconView()
        setupDateLabel()
    }

    private func setupStackView() {
        stackView.then {
            addSubview($0)
            $0.axis = .horizontal
            $0.alignment = .center
        }.layout {
            $0.leading == leadingAnchor + 8
            $0.top == topAnchor
        }
    }

    private func addIcon(_ iconName: String, imageView: UIImageView) {
        imageView.then {
            stackView.addArrangedSubview($0)
            stackView.setCustomSpacing(16, after: $0)
            $0.image = UIImage(systemName: iconName)
            $0.contentMode = .scaleAspectFit
            $0.tintColor = .black
        }.layout {
            $0.size == CGSize(width: 28, height: 28)
        }
    }

    private func setupBookMarkIconView() {
        bookMarkIconView.then {
            addSubview($0)
            $0.image = UIImage(systemName: "bookmark")
            $0.contentMode = .scaleAspectFit
            $0.tintColor = .black
        }.layout {
            $0.trailing == trailingAnchor - 8
            $0.size == CGSize(width: 28, height: 28)
            $0.centerY == stackView.centerYAnchor
        }
    }

    private func setupDateLabel() {
        dateLabel.then {
            $0.font = .systemFont(ofSize: 14, weight: .regular)
            $0.textColor = .gray
            addSubview($0)
        }.layout {
            $0.top == stackView.bottomAnchor + 8
            $0.leading == leadingAnchor + 12
            $0.bottom == bottomAnchor
        }
    }
}
