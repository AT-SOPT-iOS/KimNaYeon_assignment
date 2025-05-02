//
//  TvingNavigationBar.swift
//  TvingClone
//
//  Created by 김나연 on 5/2/25.
//

import UIKit
import SnapKit
import Then

final class TvingNavigationBar: UIView {

    // MARK: - UI
    private let logoImageView = UIImageView().then {
        $0.image = UIImage(named: "TvingLogoClear")
        $0.contentMode = .scaleAspectFit
    }

    let searchButton = UIButton(type: .system).then {
        $0.setImage(UIImage(named: "Search"), for: .normal)
        $0.tintColor = .whiteT
    }

    let charactorImageView = UIImageView().then {
        $0.image = UIImage(named: "TvingCharactor")
    }

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Layout
    private func setupLayout() {
        addSubviews(logoImageView, searchButton, charactorImageView)

        logoImageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.height.equalTo(78)
            $0.width.equalTo(191)
        }

        searchButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(51)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(30)
        }

        charactorImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(11)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(30)
        }
    }
}
