//
//  TvCollectionViewCell.swift
//  TvingClone
//
//  Created by 김나연 on 5/2/25.
//

import UIKit

class TvCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Property
    private let backgroundContainerView = UIView().then {
        $0.backgroundColor = .gray4
        $0.layer.cornerRadius = 4
        $0.clipsToBounds = true
    }
    private let tvImageView = UIImageView()
    
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
        addSubview(backgroundContainerView)
        backgroundContainerView.addSubview(tvImageView)
        
        backgroundContainerView.snp.makeConstraints {
            $0.width.equalTo(90)
            $0.height.equalTo(45)
            $0.center.equalToSuperview()
        }
        tvImageView.snp.makeConstraints{
            $0.width.equalTo(68)
            $0.height.equalTo(34)
            $0.center.equalToSuperview()
        }
    }
}
extension TvCollectionViewCell {
    func dataBind(data: TvData) {
        tvImageView.image = data.image
    }
}

