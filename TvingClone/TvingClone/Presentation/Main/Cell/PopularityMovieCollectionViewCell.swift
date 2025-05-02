//
//  PopularityMovieCollectionViewCell.swift
//  TvingClone
//
//  Created by 김나연 on 5/2/25.
//

import UIKit

class PopularityMovieCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Property
    private let popularMovieImageView = UIImageView().then{
        $0.layer.cornerRadius = 3
        $0.clipsToBounds = true
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
            popularMovieImageView
        )
        popularMovieImageView.snp.makeConstraints{
            $0.width.equalTo(98)
            $0.height.equalTo(146)
            $0.center.equalToSuperview()
        }
    }
}
extension PopularityMovieCollectionViewCell {
    func dataBind(data: PopularityMovieData) {
        popularMovieImageView.image = data.image
    }
}
