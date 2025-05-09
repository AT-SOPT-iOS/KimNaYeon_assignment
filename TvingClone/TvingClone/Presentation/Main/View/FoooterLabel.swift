//
//  FoooterLabel.swift
//  TvingClone
//
//  Created by 김나연 on 5/2/25.
//

import UIKit

final class FooterLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStyle()
        setupText()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupStyle() {
        self.font = UIFont(name: "Pretendard-Medium", size: 11)
        self.textAlignment = .left
        self.numberOfLines = 0 // 여러 줄 허용
    }

    private func setupText() {
        let fullText = """
        고객문의 · 이용약관 · 개인정보처리방침
        사업자정보 · 인재채용
        """

        let attributedString = NSMutableAttributedString(
            string: fullText,
            attributes: [
                .foregroundColor: UIColor.gray2,
                .font: UIFont(name: "Pretendard-Medium", size: 11)!
            ]
        )

        if let range = fullText.range(of: "개인정보처리방침") {
            let nsRange = NSRange(range, in: fullText)
            attributedString.addAttribute(.foregroundColor, value: UIColor.gray1, range: nsRange)
        }

        self.attributedText = attributedString
    }
}
