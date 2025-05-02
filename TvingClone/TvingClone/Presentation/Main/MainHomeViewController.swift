//
//  MainHomeViewController.swift
//  TvingClone
//
//  Created by 김나연 on 5/2/25.
//

import UIKit
import SnapKit
import Then

class MainHomeViewController: UIViewController {
    
    private var currentPageIndex = 0 {
        didSet {
            guard oldValue != currentPageIndex else { return }

            let direction: UIPageViewController.NavigationDirection = oldValue < currentPageIndex ? .forward : .reverse
            pageViewController.setViewControllers(
                [viewControllers[currentPageIndex]],
                direction: direction,
                animated: true
            )
            topTabBarView.setIndicatorBar(to: currentPageIndex)
        }
    }
    private let viewControllers: [UIViewController] = TopTabBarView.TopTabBarTitle.allCases.map { $0.viewController }
    private var isNavBarHidden = false
    
    // MARK: - Property
    private let tvingNavigationBar = TvingNavigationBar()
    private let topTabBarView = TopTabBarView()
    
    private let placeholderView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    private lazy var pageViewController: UIPageViewController = {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.delegate = self
        pageViewController.dataSource = self
        return pageViewController
    }()
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blackT
        setLayout()
        setStyle()
        topTabBarView.setInitialIndicatorPosition()
        
        addChild(pageViewController)
        pageViewController.didMove(toParent: self)
        pageViewController.setViewControllers(
            [viewControllers[currentPageIndex]],
            direction: .forward,
            animated: false
        )
    }
    
    private func setLayout() {
        view.addSubviews(
            tvingNavigationBar,
            topTabBarView,
            pageViewController.view
        )
        
        tvingNavigationBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(78)
        }
        
        topTabBarView.snp.makeConstraints {
            $0.top.equalTo(tvingNavigationBar.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(43)
        }
        
        pageViewController.view.snp.makeConstraints {
            $0.top.equalTo(topTabBarView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func setStyle() {
        topTabBarView.delegate = self
    }
}
extension MainHomeViewController: TopTabBarViewDelegate {
    func didTopTapBarTab(index: Int) {
        currentPageIndex = index
    }
}
extension MainHomeViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = viewControllers.firstIndex(of: viewController), index > 0 else { return nil }
        return viewControllers[index - 1]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = viewControllers.firstIndex(of: viewController), index < viewControllers.count - 1 else { return nil }
        return viewControllers[index + 1]
    }

    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard completed,
              let currentVC = pageViewController.viewControllers?.first,
              let index = viewControllers.firstIndex(of: currentVC) else { return }

        currentPageIndex = index
        topTabBarView.setIndicatorBar(to: index)
    }
}
