//
//  BaseBallCollectionViewCell.swift
//  TvingClone
//
//  Created by 김나연 on 5/2/25.
//

import UIKit

class BaseBallCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Property
    private let backgroundBoxView = UIView()
    private let baseBallImageView = UIImageView()
    
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
        contentView.addSubview(backgroundBoxView)
        backgroundBoxView.addSubview(baseBallImageView)
        
        backgroundBoxView.snp.makeConstraints {
            $0.width.equalTo(80)
            $0.height.equalTo(50)
            $0.center.equalToSuperview()
        }
                
        baseBallImageView.snp.makeConstraints {
            $0.width.height.equalTo(30)
            $0.center.equalToSuperview()
        }
    }
    
    func configure(with index: Int) {
        backgroundBoxView.backgroundColor = (index % 2 == 0) ? .black : .white
    }
}
extension BaseBallCollectionViewCell {
    func dataBind(data: BaseballData) {
        baseBallImageView.image = data.image
    }
}

