//
//  WelcomeViewController.swift
//  TvingClone
//
//  Created by 김나연 on 4/24/25.
//

import UIKit
import SnapKit

protocol DataBindDelegate: AnyObject {
    func dataBind(id: String)
}
protocol NicknameDelegate: AnyObject {
    func nicknameDataBind(_ nickname: String)
}

class WelcomeViewController: UIViewController {
    
    weak var delegete: DataBindDelegate?
    var id: String?
    var nickname: String?
    
    // MARK: - Property
    private lazy var tvingImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "TvingLogo")
        return imageView
    }()
    
    private lazy var welcomLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString.pretendardStyled(
            "???님 \n반가워요!",
            size: 23,
            weight: .bold
        )
        label.textColor = UIColor.whiteT
        label.numberOfLines = 2
        return label
    }()
    
    /// 버튼
    private lazy var goToMainButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.tvingRed
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(UIColor.whiteT, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        
        /// 둥근 모서리
        button.layer.cornerRadius = 3
        button.clipsToBounds = true
        return button
    }()

    // MARK: - Init
    override func viewDidLoad() {
        view.self.backgroundColor = UIColor.blackT
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        addProperty()
        makeConstraints()
//        bindID()
        bindNickname()
    }
    
    // MARK: - ConstraintsFuntion
    /// 프로퍼티 추가 함수
    private func addProperty() {
        [tvingImage, welcomLabel, goToMainButton].forEach {
            self.view.addSubview($0)
        }
    }
    
    /// 오토레이아웃 조정
    private func makeConstraints() {
        tvingImage.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.lessThanOrEqualTo(210.94)
            make.top.equalToSuperview().offset(58)
        }
        
        welcomLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(336)
        }
        
        goToMainButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.greaterThanOrEqualTo(52)
            make.top.equalToSuperview().offset(694)
        }
    }
    
    // MARK: - Function
    private func bindID(){
        if let id{
            self.welcomLabel.text = "\(id)님 \n반가워요!"
        }
    }
    private func bindNickname(){
        if let nickname{
            self.welcomLabel.text = "\(nickname)님 \n반가워요!"
        }
    }
    
    @objc
    private func backToLoginButtonDidTap(){
        if let id = id{
            delegete?.dataBind(id: id)
        }
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
