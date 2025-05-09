//
//  TodayTvingCollectionViewCell.swift
//  TvingClone
//
//  Created by 김나연 on 5/2/25.
//

import UIKit

class TodayTvingCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Property
    private let todayTvingImageView = UIImageView().then{
        $0.layer.cornerRadius = 3
        $0.clipsToBounds = true
    }
    
    private let countLabel = UILabel().then{
        $0.font = UIFont.italicSystemFont(ofSize: 50)
        $0.textColor = .whiteT
    }
    
    private let stackContainerView = UIView().then {
        $0.backgroundColor = .clear
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
        contentView.addSubview(stackContainerView)
        stackContainerView.addSubviews(countLabel, todayTvingImageView)
        
        stackContainerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        todayTvingImageView.snp.makeConstraints{
            $0.width.equalTo(98)
            $0.height.equalTo(146)
            $0.top.bottom.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        countLabel.snp.makeConstraints{
            $0.trailing.equalTo(todayTvingImageView.snp.leading).offset(-5)
            $0.bottom.equalTo(todayTvingImageView.snp.bottom).offset(-8)
            $0.leading.equalToSuperview()
        }
    }
}
extension TodayTvingCollectionViewCell {
    func dataBind(data: TodayTvingData) {
        todayTvingImageView.image = data.image
        countLabel.text = data.count
    }
}
