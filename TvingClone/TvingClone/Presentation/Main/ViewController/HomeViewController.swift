//
//  HomeViewController.swift
//  TvingClone
//
//  Created by 김나연 on 5/2/25.
//

import UIKit

protocol ScrollSyncDelegate: AnyObject {
    func didScroll(yOffset: CGFloat)
}

class HomeViewController: UIViewController {
    
    weak var scrollDelegate: ScrollSyncDelegate?

    // MARK: - Data
    private let todayTvingData = TodayTvingData.dummy()
    private let popularityLiveData = PopularityLiveData.dummy()
    private let popularityMovieData = PopularityMovieData.dummy()
    private let baseballData = BaseballData.dummy()
    private let tvData = TvData.dummy()
    private let best5Data = Best5Data.dummy()
    
    // MARK: - Property
    private let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
    }
    private let contentView = UIView()
    
    /// 너의 이름은
    private lazy var whatIsYourNameImageView = UIImageView().then{
        $0.image = UIImage(named: "WYN")
    }
    
    /// 오늘의 티빙
    private lazy var todayTvingTOPLabel = UILabel().then{
        $0.text = "오늘의 티빙 TOP 20"
        $0.font = UIFont(name: "Pretendard-Bold", size: 15)
        $0.textColor = .whiteT
    }
    
    private lazy var todayTivingTOPCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(TodayTvingCollectionViewCell.self, forCellWithReuseIdentifier: TodayTvingCollectionViewCell.identifier)
        collectionView.tag = 1
        return collectionView
    }()
    
    /// 실시간 인기 라이브
    private lazy var popularityLiveTitle = ViewMoreView().then {
        $0.configure(title: "실시간 인기 LIVE")
    }
    
    private lazy var popularityLiveCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PopularityLiveCollectionViewCell.self, forCellWithReuseIdentifier: PopularityLiveCollectionViewCell.identifier)
        collectionView.tag = 2
        return collectionView
    }()
    
    /// 실시간 인기 영화
    private lazy var popularityMovieTitle = ViewMoreView().then {
        $0.configure(title: "실시간 인기 영화")
    }
    
    private lazy var popularityMovieCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PopularityMovieCollectionViewCell.self, forCellWithReuseIdentifier: PopularityMovieCollectionViewCell.identifier)
        collectionView.tag = 3
        return collectionView
    }()
    
    private lazy var baseBallCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(BaseBallCollectionViewCell.self, forCellWithReuseIdentifier: BaseBallCollectionViewCell.identifier)
        collectionView.tag = 4
        return collectionView
    }()
    
    private lazy var tvCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(TvCollectionViewCell.self, forCellWithReuseIdentifier: TvCollectionViewCell.identifier)
        collectionView.tag = 5
        return collectionView
    }()
    
    /// 인생작
    private lazy var best5Label = UILabel().then{
        $0.text = "김가현PD의 인생작 TOP 5"
        $0.font = UIFont(name: "Pretendard-Bold", size: 15)
        $0.textColor = .whiteT
    }
    
    private lazy var best5CollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(Beat5CollectionViewCell.self, forCellWithReuseIdentifier: Beat5CollectionViewCell.identifier)
        collectionView.tag = 6
        return collectionView
    }()
    
    private lazy var notificationView = NoticeView()
    
    private lazy var footerLabel = FooterLabel()
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        view.self.backgroundColor = .blackT
        setLayout()
        scrollView.delegate = self
//        addStackProperty()
    }
    
//    // MARK: - Stack
//        
//    /// 스택 중복 코드 생성
//    private func createStackView(_ space: CGFloat) -> UIStackView {
//        let stack = UIStackView()
//        stack.axis = .vertical
//        stack.distribution = .fill
//        stack.spacing = space
//        return stack
//    }
//    
//    /// 오늘의 티빙
//    private lazy var todayTvingStack: UIStackView = {
//        return createStackView(9)
//    }()
//    /// 인기 라이브
//    private lazy var popularityLiveStack: UIStackView = {
//        return createStackView(9)
//    }()
//    /// 인기 영화
//    private lazy var popularityMovieStack: UIStackView = {
//        return createStackView(13)
//    }()
//    /// 인생작
//    private lazy var best5Stack: UIStackView = {
//        return createStackView(13)
//    }()
    
    // MARK: - Layout
//    private func addStackProperty() {
//        todayTvingStack.addArrangedSubview(todayTvingTOPLabel)
//        todayTvingStack.addArrangedSubview(todayTivingTOPCollectionView)
//        
//        popularityLiveStack.addArrangedSubview(popularityLiveTitle)
//        popularityLiveStack.addArrangedSubview(popularityLiveCollectionView)
//        
//        popularityMovieStack.addArrangedSubview(popularityMovieTitle)
//        popularityMovieStack.addArrangedSubview(popularityMovieCollectionView)
//        
//        best5Stack.addArrangedSubview(best5Label)
//        best5Stack.addArrangedSubview(best5CollectionView)
//    }
    
    private func setLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(
            whatIsYourNameImageView,
            todayTvingTOPLabel,
            todayTivingTOPCollectionView,
            popularityLiveTitle,
            popularityLiveCollectionView,
            popularityMovieTitle,
            popularityMovieCollectionView,
            baseBallCollectionView,
            tvCollectionView,
            best5Label,
            best5CollectionView,
            notificationView,
            footerLabel
        )
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(scrollView.snp.width)
        }
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        whatIsYourNameImageView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(whatIsYourNameImageView.snp.width).multipliedBy(1.4425)
        }
        todayTvingTOPLabel.snp.makeConstraints{
            $0.top.equalTo(whatIsYourNameImageView.snp.bottom).offset(9)
            $0.leading.equalToSuperview().inset(12)
        }
        todayTivingTOPCollectionView.snp.makeConstraints{
            $0.top.equalTo(todayTvingTOPLabel.snp.bottom).offset(9)
            $0.leading.trailing.equalToSuperview()
            $0.height.greaterThanOrEqualTo(146)
        }
        popularityLiveTitle.snp.makeConstraints{
            $0.top.equalTo(todayTivingTOPCollectionView.snp.bottom).offset(18)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(23)
        }
        popularityLiveCollectionView.snp.makeConstraints{
            $0.top.equalTo(popularityLiveTitle.snp.bottom).offset(9)
            $0.leading.trailing.equalToSuperview()
            $0.height.greaterThanOrEqualTo(137)
        }
        popularityMovieTitle.snp.makeConstraints{
            $0.top.equalTo(popularityLiveCollectionView.snp.bottom).offset(18)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(23)
        }
        popularityMovieCollectionView.snp.makeConstraints{
            $0.top.equalTo(popularityMovieTitle.snp.bottom).offset(13)
            $0.leading.trailing.equalToSuperview()
            $0.height.greaterThanOrEqualTo(146)
        }
        baseBallCollectionView.snp.makeConstraints{
            $0.top.equalTo(popularityMovieCollectionView.snp.bottom).offset(33)
            $0.leading.trailing.equalToSuperview()
            $0.height.greaterThanOrEqualTo(50)
        }
        tvCollectionView.snp.makeConstraints{
            $0.top.equalTo(baseBallCollectionView.snp.bottom).offset(28)
            $0.leading.trailing.equalToSuperview()
            $0.height.greaterThanOrEqualTo(45)
        }
        best5Label.snp.makeConstraints{
            $0.top.equalTo(tvCollectionView.snp.bottom).offset(25)
            $0.leading.equalToSuperview().inset(12)
        }
        best5CollectionView.snp.makeConstraints{
            $0.top.equalTo(best5Label.snp.bottom).offset(13)
            $0.leading.trailing.equalToSuperview()
            $0.height.greaterThanOrEqualTo(90)
        }
        notificationView.snp.makeConstraints{
            $0.top.equalTo(best5CollectionView.snp.bottom).offset(23)
            $0.leading.trailing.equalToSuperview().inset(14)
        }
        footerLabel.snp.makeConstraints{
            $0.top.equalTo(notificationView.snp.bottom).offset(13)
            $0.bottom.equalToSuperview().inset(99)
            $0.leading.equalToSuperview().inset(20)
        }
    }
}
// MARK: - Extension

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 1:
            return todayTvingData.count
        case 2:
            return popularityLiveData.count
        case 3:
            return popularityMovieData.count
        case 4:
            return baseballData.count
        case 5:
            return tvData.count
        case 6:
            return best5Data.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag {
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayTvingCollectionViewCell.identifier, for: indexPath) as?
                    TodayTvingCollectionViewCell else { return UICollectionViewCell() }
            cell.dataBind(data: todayTvingData[indexPath.item])
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularityLiveCollectionViewCell.identifier, for: indexPath) as?
                    PopularityLiveCollectionViewCell else { return UICollectionViewCell() }
            cell.dataBind(data: popularityLiveData[indexPath.item])
            return cell
        case 3:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularityMovieCollectionViewCell.identifier, for: indexPath) as?
                    PopularityMovieCollectionViewCell else { return UICollectionViewCell() }
            cell.dataBind(data: popularityMovieData[indexPath.item])
            return cell
        case 4:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BaseBallCollectionViewCell.identifier, for: indexPath) as?
                    BaseBallCollectionViewCell else { return UICollectionViewCell() }
            cell.dataBind(data: baseballData[indexPath.item])
            cell.configure(with: indexPath.row)
            return cell
        case 5:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TvCollectionViewCell.identifier, for: indexPath) as?
                    TvCollectionViewCell else { return UICollectionViewCell() }
            cell.dataBind(data: tvData[indexPath.item])
            return cell
        case 6:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Beat5CollectionViewCell.identifier, for: indexPath) as?
                    Beat5CollectionViewCell else { return UICollectionViewCell() }
            cell.dataBind(data: best5Data[indexPath.item])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}
extension HomeViewController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ cv: UICollectionView,
                      layout _: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    switch cv.tag {
    case 1:
        return CGSize(width: 133, height: 146)
    case 2:
        return CGSize(width: 160, height: 137)
    case 3:
        return CGSize(width: 98, height: 146)
    case 4:
        return CGSize(width: 80, height: 50)
    case 5:
        return CGSize(width: 90, height: 45)
    case 6:
        return CGSize(width: 160, height: 90)
    default:
      return .zero
    }
  }

  func collectionView(_ cv: UICollectionView,
                      layout _: UICollectionViewLayout,
                      minimumLineSpacingForSectionAt _: Int) -> CGFloat {
    switch cv.tag {
    case 1: return 11.67
    case 2: return 7
    case 3: return 8
    case 5: return 7
    case 6: return 8
    default: return 0
    }
  }

  func collectionView(_ cv: UICollectionView,
                      layout _: UICollectionViewLayout,
                      minimumInteritemSpacingForSectionAt _: Int) -> CGFloat {
    switch cv.tag {
    case 1: return 11.67
    default: return 0
    }
  }
}

extension HomeViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollDelegate?.didScroll(yOffset: scrollView.contentOffset.y)
    }
}
