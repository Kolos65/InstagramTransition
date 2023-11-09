//
//  TestViewController.swift
//  InstagramTransition
//
//  Created by Kolos Foltanyi on 2023. 07. 23..
//

import UIKit

class TestViewController: UIViewController {
    private let destinationParentRect = UIView()
    private let destinationRect = UIView()
    private let sourceRect = UIView()
    private let maskRect = UIView()
    private let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        edgesForExtendedLayout = []
        setupTransitionTest()
    }

    func setupTransitionTest() {
        setupSourceRect()
        setupDestinationRect()
        setupMaskRect()
        setupButton()
    }

    func setupSourceRect() {
        sourceRect.do {
            $0.backgroundColor = .blue
            $0.frame = CGRect(x: 20, y: 400, width: 100, height: 100)
            view.addSubview($0)
        }
    }

    func setupDestinationRect() {
        destinationParentRect.do {
            $0.backgroundColor = .red
            $0.layer.opacity = 0.8
            $0.frame = CGRect(x: 150, y: 200, width: 200, height: 400)
            view.addSubview($0)
        }
        destinationRect.do {
            $0.backgroundColor = .yellow
            $0.layer.opacity = 0.8
            $0.frame = CGRect(x: 0, y: 100, width: 200, height: 250)
            destinationParentRect.addSubview($0)
        }
    }

    private func setupMaskRect() {
        maskRect.do {
            $0.layer.opacity = 0.9
            $0.backgroundColor = .green
            $0.frame = destinationParentRect.bounds
            destinationParentRect.addSubview($0)
        }
    }

    private func setupButton() {
        button.then {
            view.addSubview($0)
            $0.setTitle("Animate", for: . normal)
            $0.titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
            $0.addTarget(self, action: #selector(tapped), for: .touchUpInside)
            $0.layer.cornerRadius = 10
            $0.backgroundColor = .blue
        }.layout {
            $0.bottom == view.safeAreaLayoutGuide.bottomAnchor - 50
            $0.centerX == view.centerXAnchor
            $0.width == 100
        }
    }

    @objc func tapped() {
        if destinationParentRect.transform == .identity {
            let transform: CGAffineTransform = .transform(
                parent: destinationParentRect.frameInWindow!,
                soChild: destinationRect.frameInWindow!,
                aspectFills: sourceRect.frameInWindow!
            )
            UIView.animate(withDuration: 3) { [unowned self] in
                destinationParentRect.transform = transform
                maskRect.frame = sourceRect.frame.aspectFit(to: destinationRect.frame)
            }
        } else {
            UIView.animate(withDuration: 3) { [unowned self] in
                destinationParentRect.transform = .identity
                maskRect.frame = destinationParentRect.bounds
            }
        }

    }
}
