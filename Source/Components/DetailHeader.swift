//
//  DetailHeader.swift
//  InstagramTransition
//
//  Created by Kolos Foltanyi on 2023. 07. 22..
//

import UIKit

class DetailHeader: UIView {

    // MARK: Public properties

    var backNavigation: (() -> Void)?

    // MARK: UI properties

    private let stackView = UIStackView()
    private let backButton = UIButton(configuration: .plain())
    private let titleStackView = UIStackView()
    private let userNameLabel = UILabel()
    private let titleLabel = UILabel()
    private let separator = UIView()

    // MARK: Helpers

    private var backAction: UIAction {
        UIAction(handler: { [weak self] _ in self?.backNavigation?() })
    }

    // MARK: Init

    init(title: String, userName: String) {
        super.init(frame: .zero)
        setupUI()
        titleLabel.text = title
        userNameLabel.text = userName
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

extension DetailHeader {
    private func setupUI() {
        setupStackView()
        setupSeparator()
        setupBackButton()
        setupTitleStackView()
        setupUserNameLabel()
        setupTitleLabel()
        setupPlaceHolder()
    }

    private func setupStackView() {
        stackView.do {
            addSubview($0)
            fillWith($0, insets: .init(top: 0, left: 8, bottom: 16, right: 8))
            $0.axis = .horizontal
            $0.alignment = .center
        }
    }

    private func setupSeparator() {
        separator.then {
            addSubview($0)
            $0.backgroundColor = .gray
        }.layout {
            $0.leading == leadingAnchor
            $0.trailing == trailingAnchor
            $0.bottom == bottomAnchor
            $0.height == 0.5
        }
    }

    private func setupBackButton() {
        backButton.then {
            let configuration = UIImage.SymbolConfiguration(weight: .bold)
            let image = UIImage(systemName: "chevron.left", withConfiguration: configuration)
            $0.setImage(image, for: .normal)
            $0.tintColor = .black
            stackView.addArrangedSubview($0)
            $0.addAction(backAction, for: .touchUpInside)
        }.layout {
            $0.size == CGSize(width: 40, height: 40)
        }
    }

    private func setupTitleStackView() {
        titleStackView.do {
            stackView.addArrangedSubview($0)
            $0.axis = .vertical
            $0.alignment = .center
        }
    }

    private func setupUserNameLabel() {
        userNameLabel.do {
            $0.font = .systemFont(ofSize: 15, weight: .medium)
            $0.textColor = .gray
            titleStackView.addArrangedSubview($0)
        }
    }

    private func setupTitleLabel() {
        titleLabel.do {
            $0.font = .systemFont(ofSize: 20, weight: .semibold)
            titleStackView.addArrangedSubview($0)
        }
    }

    private func setupPlaceHolder() {
        UIView().then {
            stackView.addArrangedSubview($0)
        }.layout {
            $0.size == CGSize(width: 40, height: 40)
        }
    }
}
