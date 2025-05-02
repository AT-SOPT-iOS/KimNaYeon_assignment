//
//  NotificationView.swift
//  TvingClone
//
//  Created by 김나연 on 5/2/25.
//

import UIKit
import SnapKit
import Then

final class NoticeView: UIView {
    
    private let noticeLabel = UILabel().then {
        $0.text = "공지"
        $0.font = UIFont(name: "Pretendard-Medium", size: 11)
        $0.textColor = .gray2
    }
    
    private let contentLabel = UILabel().then {
        $0.text = "티빙 계정 공유 정책 추가 안내"
        $0.font = UIFont(name: "Pretendard-Medium", size: 11)
        $0.textColor = .gray1
    }
    
    private let arrowButton = UIButton(type: .system).then {
        let config = UIImage.SymbolConfiguration(pointSize: 18, weight: .regular)
        let image = UIImage(systemName: "chevron.right", withConfiguration: config)
        $0.setImage(image, for: .normal)
        $0.tintColor = .whiteT
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setStyle() {
        self.backgroundColor = .gray4
        self.layer.cornerRadius = 5
    }

    private func setLayout() {
        addSubviews(noticeLabel, contentLabel, arrowButton)
        
        self.snp.makeConstraints {
            $0.height.equalTo(50)
        }
        
        noticeLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(17)
            $0.centerY.equalToSuperview()
        }

        contentLabel.snp.makeConstraints {
            $0.leading.equalTo(noticeLabel.snp.trailing).offset(8)
            $0.centerY.equalToSuperview()
        }

        arrowButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.size.equalTo(18)
            $0.trailing.equalToSuperview().inset(16)
        }
    }
}
