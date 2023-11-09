//
//  DetailScreen.swift
//  InstagramTransition
//
//  Created by Kolos Foltanyi on 2023. 07. 22..
//

import UIKit

class DetailScreen: UIViewController {

    // MARK: Private properties

    private var picture: Picture

    // MARK: UI Properties

    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let header = DetailHeader(title: "Posts", userName: "USER")
    private let imageHeader = ImageHeader(userName: "user", location: "Budapest")
    private let imageView = ImageView()
    private let imageFooter = ImageFooter(date: "6 days ago")
    private lazy var recognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
    private let transitionAnimator = SharedTransitionAnimator()
    private var interactionController: SharedTransitionInteractionController?

    // MARK: Init

    init(picture: Picture) {
        self.picture = picture
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        setupUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.delegate = self
    }
}

// MARK: - Setup

extension DetailScreen {
    private func setupUI() {
        setupView()
        setupHeader()
        setupScrollView()
        setupImageHeader()
        setupImageView()
        setupImageFooter()
    }

    private func setupView() {
        view.backgroundColor = .white
        view.addGestureRecognizer(recognizer)
        recognizer.delegate = self
    }

    private func setupHeader() {
        header.then {
            view.addSubview($0)
            $0.backNavigation = { [weak self] in
                self?.navigationController?.popViewController(animated: true)
            }
        }.layout {
            $0.top == view.safeAreaLayoutGuide.topAnchor
            $0.leading == view.leadingAnchor
            $0.trailing == view.trailingAnchor
        }
    }

    private func setupScrollView() {
        scrollView.then {
            $0.alwaysBounceVertical = true
            view.addSubview($0)
        }.layout {
            $0.top == header.bottomAnchor
            $0.leading == view.leadingAnchor
            $0.trailing == view.trailingAnchor
            $0.bottom == view.safeAreaLayoutGuide.bottomAnchor
        }

        contentView.then {
            scrollView.addSubview($0)
            scrollView.fillWith($0)
        }.layout {
            $0.width == scrollView.widthAnchor
            $0.height >= scrollView.heightAnchor
        }
    }

    private func setupImageHeader() {
        imageHeader.then {
            contentView.addSubview($0)
        }.layout {
            $0.top == contentView.topAnchor + 8
            $0.leading == view.leadingAnchor
            $0.trailing == view.trailingAnchor
        }
    }

    private func setupImageView() {
        imageView.then {
            contentView.addSubview($0)
            $0.contentMode = .scaleAspectFit
            $0.layer.masksToBounds = true
            $0.setImage(from: picture.imageURL)
        }.layout {
            $0.leading == contentView.leadingAnchor
            $0.trailing == contentView.trailingAnchor
            $0.top == imageHeader.bottomAnchor + 10
        }

        imageView.heightAnchor.constraint(
            equalTo: imageView.widthAnchor,
            multiplier: 1.25
        ).isActive = true
    }

    private func setupImageFooter() {
        imageFooter.then {
            contentView.addSubview($0)
        }.layout {
            $0.top == imageView.bottomAnchor + 10
            $0.leading == contentView.leadingAnchor
            $0.trailing == contentView.trailingAnchor
        }
    }
}

// MARK: UIGestureRecognizerDelegate

extension DetailScreen: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
                           shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        scrollView.isBouncing
    }
}

// MARK: - UINavigationControllerDelegate

extension DetailScreen: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard fromVC is Self, toVC is ProfileScreen else { return nil }
        transitionAnimator.transition = .pop
        return transitionAnimator
    }

    func navigationController(
        _ navigationController: UINavigationController,
        interactionControllerFor animationController: UIViewControllerAnimatedTransitioning
    ) -> UIViewControllerInteractiveTransitioning? {
        interactionController
    }
}

// MARK: UIPanGestureRecognizer

extension DetailScreen {
    @objc
    func handlePan(_ recognizer: UIPanGestureRecognizer) {
        let window = UIApplication.keyWindow!
        switch recognizer.state {
        case .began:
            let velocity = recognizer.velocity(in: window)
            guard abs(velocity.x) > abs(velocity.y) else { return }
            interactionController = SharedTransitionInteractionController()
            navigationController?.popViewController(animated: true)
        case .changed:
            interactionController?.update(recognizer)
        case .ended:
            if recognizer.velocity(in: window).x > 0 {
                interactionController?.finish()
            } else {
                interactionController?.cancel()
            }
            interactionController = nil
        default:
            interactionController?.cancel()
            interactionController = nil
        }
    }
}

// MARK: SharedTransitioning

extension DetailScreen: SharedTransitioning {
    var sharedFrame: CGRect {
        imageView.frameInWindow ?? .zero
    }
}
