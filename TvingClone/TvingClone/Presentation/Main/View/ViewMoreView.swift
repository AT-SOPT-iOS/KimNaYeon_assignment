//
//  ViewMoreView.swift
//  TvingClone
//
//  Created by 김나연 on 5/2/25.
//

import UIKit
import SnapKit
import Then

final class ViewMoreView: UIView {
    
    // MARK: - Property
    private let titleLabel = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Bold", size: 15)
        $0.textColor = .whiteT
    }
    
    private let actionButton = UIButton(type: .system).then {
        $0.setTitle("더보기", for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 12)
        $0.setTitleColor(.gray2, for: .normal)
    }

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Layout
    private func setLayout() {
        addSubview(titleLabel)
        addSubview(actionButton)
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(13)
            $0.centerY.equalToSuperview()
        }

        actionButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(4)
            $0.centerY.equalToSuperview()
        }
    }

    // MARK: Function 나중에 23 헤이트 설정하기 희희
    func configure(title: String) {
        titleLabel.text = title
    }
}
