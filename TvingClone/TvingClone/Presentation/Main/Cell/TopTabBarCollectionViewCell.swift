//
//  TopTabBarCollectionViewCell.swift
//  TvingClone
//
//  Created by 김나연 on 5/2/25.
//

import UIKit
import Then
import SnapKit

class TopTabBarCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Property
    private let titleLabel = UILabel().then{
        $0.textColor = .whiteT
        $0.font = UIFont(name: "Pretendard-Regular", size: 17)
    }
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
    }
    
    //MARK: - Function
    func getTitleWidth() -> CGFloat {
        return self.titleLabel.frame.width
    }
}
extension TopTabBarCollectionViewCell {
    func dataBind(text: String) {
        titleLabel.text = text
    }
}
