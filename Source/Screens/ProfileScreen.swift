//
//  ProfileScreen.swift
//  InstagramTransition
//
//  Created by Kolos Foltanyi on 2023. 07. 22..
//

import UIKit

class ProfileScreen: UIViewController {

    // MARK: Constants

    private enum Constants {
        static let numberOfRows = 3
        static let sectionInset: UIEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 0)
        static let interItemSpacing: CGFloat = 2
        static let lineSpacing: CGFloat = 2
    }

    // MARK: Typealiases

    typealias DataSource = UICollectionViewDiffableDataSource<Int, Picture>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, Picture>

    // MARK: UI properties

    private let transitionAnimator = SharedTransitionAnimator()
    private let header = ProfileHeader(title: "user")
    private lazy var dataSource = DataSource(collectionView: collectionView, cellProvider: cellProvider)
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    private lazy var layout = UICollectionViewFlowLayout().then {
        $0.sectionInset = Constants.sectionInset
        $0.minimumLineSpacing = Constants.lineSpacing
        $0.minimumInteritemSpacing = Constants.interItemSpacing
    }

    // MARK: Private properties

    private var selectedIndexPath: IndexPath? = nil
    private var pictures = [Picture]() {
        didSet { updateCollectionView() }
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        setupUI()
        pictures = Picture.list
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.delegate = self
    }
}

// MARK: - Helpers

extension ProfileScreen {
    private func setupUI() {
        setupView()
        setupHeader()
        setupCollectionView()
    }

    private func setupView() {
        view.backgroundColor = .white
    }

    private func setupHeader() {
        header.then {
            view.addSubview($0)
        }.layout {
            $0.top == view.safeAreaLayoutGuide.topAnchor
            $0.leading == view.leadingAnchor
            $0.trailing == view.trailingAnchor
        }
    }

    private func setupCollectionView() {
        collectionView.then {
            view.addSubview($0)
            $0.register(ProfileCell.self)
            $0.dataSource = dataSource
            $0.delegate = self
            $0.delaysContentTouches = false
        }.layout {
            $0.leading == view.leadingAnchor
            $0.trailing == view.trailingAnchor
            $0.top == header.bottomAnchor
            $0.bottom == view.bottomAnchor
        }
    }
}

// MARK: - UICollectionView helpers

extension ProfileScreen {
    private func updateCollectionView() {
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(pictures, toSection: 0)
        dataSource.apply(snapshot, animatingDifferences: true)
    }

    private var cellProvider: DataSource.CellProvider {
        { [unowned self] collectionView, indexPath, _ in
            let cell = collectionView.dequeuCellOfType(ProfileCell.self, for: indexPath)
            let picture = pictures[indexPath.row]
            cell.setup(with: picture)
            return cell
        }
    }
}

// MARK: - UICollectionViewDelegate

extension ProfileScreen: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndexPath = indexPath
        let picture = pictures[indexPath.item]
        let viewController = DetailScreen(picture: picture)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout methods

extension ProfileScreen: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacingWidth = CGFloat(Constants.numberOfRows - 1) * Constants.interItemSpacing
        let contentWidth = collectionView.frame.inset(by: Constants.sectionInset).width
        let availableWidth = contentWidth - spacingWidth
        let size = availableWidth / CGFloat(Constants.numberOfRows)
        return CGSize(width: size, height: size)
    }
}

// MARK: - UINavigationControllerDelegate

extension ProfileScreen: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if fromVC is Self, toVC is DetailScreen {
            transitionAnimator.transition = .push
            return transitionAnimator
        }
        if toVC is Self, fromVC is DetailScreen {
            transitionAnimator.transition = .pop
            return transitionAnimator
        }
        return nil
    }
}

// MARK: - SharedTransitioning

extension ProfileScreen: SharedTransitioning {
    var sharedFrame: CGRect {
        guard let selectedIndexPath,
              let cell = collectionView.cellForItem(at: selectedIndexPath),
              let frame = cell.frameInWindow else { return .zero }
        return frame
    }

    func prepare(for transition: SharedTransitionAnimator.Transition) {
        guard transition == .pop, let selectedIndexPath else { return }
        collectionView.verticalScrollItemVisible(at: selectedIndexPath, with: 40, animated: false)
    }
}
