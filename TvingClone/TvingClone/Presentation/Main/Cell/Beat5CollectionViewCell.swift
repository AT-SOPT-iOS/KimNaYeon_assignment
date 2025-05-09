//
//  Beat5CollectionViewCell.swift
//  TvingClone
//
//  Created by 김나연 on 5/2/25.
//

import UIKit

class Beat5CollectionViewCell: UICollectionViewCell {
    
    // MARK: - Property
    private let best5ImageView = UIImageView().then{
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
            best5ImageView
        )
        best5ImageView.snp.makeConstraints{
            $0.width.equalTo(160)
            $0.height.equalTo(80)
            $0.center.equalToSuperview()
        }
    }
}
extension Beat5CollectionViewCell {
    func dataBind(data: Best5Data) {
        best5ImageView.image = data.image
    }
}
