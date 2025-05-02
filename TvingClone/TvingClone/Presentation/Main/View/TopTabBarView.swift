//
//  TopTabBarView.swift
//  TvingClone
//
//  Created by 김나연 on 5/1/25.
//

import UIKit
import SnapKit
import Then

protocol TopTabBarViewDelegate: AnyObject {
    func didTopTapBarTab(index: Int)
}
class TopTabBarView: UIView {
    
    final let tvingInterItemSpacing: CGFloat = 28
    weak var delegate: TopTabBarViewDelegate?

    enum TopTabBarTitle: String, CaseIterable {
        case home = "홈"
        case drama = "드라마"
        case variety = "예능"
        case movie = "영화"
        case sports = "스포츠"
        case news = "뉴스"
        
        var viewController: UIViewController {
            switch self {
            case .home:
                return HomeViewController()
            case .drama:
                return DummyViewController()
            default:
                return UIViewController()
            }
        }
    }
    
    private var targetIndex: Int = 0 {
        didSet {
            moveIndicator(targetIndex: targetIndex)
        }
    }
    
    // MARK: - Property
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    } ()
    
    private let indicatorUnderlineView = UIView().then {
        $0.backgroundColor = .gray4
    }
    
    private let indicatorView = UIView().then {
        $0.backgroundColor = .whiteT
    }
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
        setStyle()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Set
    private func setStyle() {
        collectionView.do {
            $0.dataSource = self
            $0.delegate = self
            $0.register(TopTabBarCollectionViewCell.self, forCellWithReuseIdentifier: TopTabBarCollectionViewCell.identifier)
        }
    }
    private func setLayout() {
        self.addSubviews(
            collectionView,
            indicatorUnderlineView,
            indicatorView
        )
        collectionView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(indicatorUnderlineView.snp.top)
        }
        indicatorUnderlineView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(1)
        }
        indicatorView.snp.makeConstraints{
            $0.bottom.equalTo(indicatorUnderlineView.snp.top)
            $0.height.equalTo(3)
            $0.width.equalTo(15)
        }
    }
    func setInitialIndicatorPosition() {
        collectionView.layoutIfNeeded()
        setIndicatorBar(to: 0)
    }
}
extension TopTabBarView {
    func moveIndicator(targetIndex: Int) {
        let indexPath = IndexPath(item: targetIndex, section: 0)
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        guard let cell = collectionView.cellForItem(at: indexPath) as? TopTabBarCollectionViewCell else {return}
        indicatorView.snp.remakeConstraints {
            $0.centerX.equalTo(cell)
            $0.width.equalTo(cell.getTitleWidth())
            $0.height.equalTo(3)
            $0.bottom.equalTo(indicatorUnderlineView.snp.top)
        }
        UIView.animate(withDuration: 0.25) {
            self.layoutIfNeeded()
        }
    }
    
    func setIndicatorBar(to targetIndex: Int) {
        self.targetIndex = targetIndex
    }
    
    func checkIsBarAndPageInSameIndex(for currentIndex: Int) -> Bool {
        return self.targetIndex == currentIndex
    }
}
extension TopTabBarView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let cellCount = TopTabBarTitle.allCases.count
        let spacing: CGFloat = tvingInterItemSpacing
        let cellWidths = TopTabBarTitle.allCases.reduce(0) { total, tab in
            let text = tab.rawValue
            let width = text.getTextContentSize(withFont: UIFont(name: "Pretendard-Regular", size: 17)!).width
            return total + width
        }
        
        let totalSpacing = CGFloat(cellCount - 1) * spacing
        let totalContentWidth = cellWidths + totalSpacing
        let horizontalInset = max((collectionView.bounds.width - totalContentWidth) / 2, 0)
        
        return UIEdgeInsets(top: 0, left: horizontalInset, bottom: 0, right: horizontalInset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return tvingInterItemSpacing
    }
}
extension TopTabBarView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TopTabBarTitle.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->
        UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopTabBarCollectionViewCell.identifier, for: indexPath) as?
            TopTabBarCollectionViewCell else { return UICollectionViewCell() }
            cell.dataBind(text: TopTabBarTitle.allCases[indexPath.item].rawValue)
            return cell
    }
    
}
extension TopTabBarView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.item
        self.targetIndex = index
        delegate?.didTopTapBarTab(index: index)
    }
}
