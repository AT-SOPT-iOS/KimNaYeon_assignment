//
//  PopularityLiveCollectionViewCell.swift
//  TvingClone
//
//  Created by 김나연 on 5/2/25.
//

import UIKit

class PopularityLiveCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Property
    private let popularityLiveImageView = UIImageView().then{
        $0.layer.cornerRadius = 3
        $0.clipsToBounds = true
    }
    
    private let countLabel = UILabel().then{
        $0.font = UIFont.italicSystemFont(ofSize: 9)
        $0.textColor = .whiteT
    }
    
    private let nameLabel = UILabel().then{
        $0.font = UIFont(name: "Pretendard-Medium", size: 10)
        $0.textColor = .whiteT
    }
    
    private let episodesLabel = UILabel().then{
        $0.font = UIFont(name: "Pretendard-Regular", size: 10)
        $0.textColor = .gray2
    }
    
    private let ratingLabel = UILabel().then{
        $0.font = UIFont(name: "Pretendard-Regular", size: 10)
        $0.textColor = .gray2
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    private func setLayout() {
        addSubviews(
            popularityLiveImageView,
            countLabel,
            nameLabel,
            episodesLabel,
            ratingLabel
        )
        popularityLiveImageView.snp.makeConstraints{
            $0.width.equalTo(160)
            $0.height.equalTo(80)
            $0.centerX.equalToSuperview()
        }
        countLabel.snp.makeConstraints{
            $0.top.equalTo(popularityLiveImageView.snp.bottom).offset(7)
            $0.leading.equalTo(popularityLiveImageView.snp.leading).offset(6)
        }
        nameLabel.snp.makeConstraints{
            $0.top.equalTo(popularityLiveImageView.snp.bottom).offset(10)
            $0.leading.equalTo(popularityLiveImageView.snp.leading).offset(23)
        }
        episodesLabel.snp.makeConstraints{
            $0.top.equalTo(popularityLiveImageView.snp.bottom).offset(25)
            $0.leading.equalTo(popularityLiveImageView.snp.leading).offset(24)
        }
        ratingLabel.snp.makeConstraints{
            $0.top.equalTo(popularityLiveImageView.snp.bottom).offset(41)
            $0.leading.equalTo(popularityLiveImageView.snp.leading).offset(24)
        }
    }
}
extension PopularityLiveCollectionViewCell {
    func dataBind(data: PopularityLiveData) {
        popularityLiveImageView.image = data.image
        countLabel.text = data.count
        nameLabel.text = data.name
        episodesLabel.text = data.episodes
        ratingLabel.text = data.rating
    }
}
