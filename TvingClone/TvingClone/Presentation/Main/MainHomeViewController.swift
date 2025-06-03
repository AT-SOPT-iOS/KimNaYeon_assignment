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
            if let scrollableViewController = viewControllers[currentPageIndex] as? HomeViewController {
                scrollableViewController.scrollDelegate = self
            }
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
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
        if let scrollableViewController = viewControllers[currentPageIndex] as? HomeViewController {
            scrollableViewController.scrollDelegate = self
        }
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        self.navigationItem.backBarButtonItem = backItem
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
extension MainHomeViewController: ScrollSyncDelegate {
    func didScroll(yOffset: CGFloat) {
        if yOffset > 30, tvingNavigationBar.superview != nil {
            tvingNavigationBar.removeFromSuperview()
            view.insertSubview(placeholderView, at: 0)
            placeholderView.snp.makeConstraints {
                $0.top.equalTo(view.safeAreaLayoutGuide)
                $0.leading.trailing.equalToSuperview()
                $0.height.equalTo(45)
            }
            topTabBarView.snp.remakeConstraints {
                $0.top.equalTo(placeholderView.snp.bottom)
                $0.leading.trailing.equalToSuperview()
                $0.height.equalTo(43)
            }
            UIView.animate(withDuration: 0.25) {
                self.view.layoutIfNeeded()
            }

        } else if yOffset <= 0, tvingNavigationBar.superview == nil {
            view.addSubview(tvingNavigationBar)
            tvingNavigationBar.snp.makeConstraints {
                $0.top.equalTo(view.safeAreaLayoutGuide)
                $0.leading.trailing.equalToSuperview()
                $0.height.equalTo(78)
            }
            placeholderView.removeFromSuperview()
            topTabBarView.snp.remakeConstraints {
                $0.top.equalTo(tvingNavigationBar.snp.bottom)
                $0.leading.trailing.equalToSuperview()
                $0.height.equalTo(43)
            }
            UIView.animate(withDuration: 0.25) {
                self.view.layoutIfNeeded()
            }
        }
    }
}
