//
//  NicknameViewController.swift
//  TvingClone
//
//  Created by 김나연 on 4/25/25.
//

import UIKit
import SnapKit

class NicknameViewController: UIViewController {
    weak var delegate: NicknameDelegate?

    // MARK: - Property
    /// 닉네임 라벨
    private lazy var nicknameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.attributedText = NSAttributedString.pretendardStyled(
            "닉네임을 입력해주세요",
            size: 23,
            weight: .medium
        )
        return label
    }()
    
    /// 텍스트필드
    private lazy var nicknameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "닉네임"
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 15)
        textField.backgroundColor = UIColor.gray2
        textField.setPlaceholderColor(UIColor.black)
        textField.textColor = UIColor.gray4
        
        /// 패딩 설정
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: 0))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        /// 둥근 모서리
        textField.layer.cornerRadius = 3
        textField.clipsToBounds = true
        
        return textField
    }()
    
    /// 저장 버튼
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.contentVerticalAlignment = .center
        button.backgroundColor = UIColor.tvingRed
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("저장하기", for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        
        /// 둥근 모서리
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        view.self.backgroundColor = UIColor.white
        addProperty()
        makeConstraints()
    }
    
    // MARK: - ConstraintsFuntion
    /// 프로퍼티 추가 함수
    private func addProperty() {
        [nicknameLabel, nicknameTextField, saveButton].forEach {
            self.view.addSubview($0)
        }
    }
    private func makeConstraints() {
        nicknameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(45)
        }
        nicknameTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.greaterThanOrEqualTo(52)
            make.top.equalToSuperview().offset(101)
        }
        saveButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.greaterThanOrEqualTo(52)
            make.top.equalToSuperview().offset(359.19)
        }
    }
    
    // MARK: - Function
    @objc private func saveButtonTapped() {
        let nickname = nicknameTextField.text ?? ""
        
        if nickname.isKorean {
            delegate?.nicknameDataBind(nickname)
            self.dismiss(animated: true)
        } else {
            let alert = UIAlertController(title: "오류", message: "닉네임은 한글 또는 특수문자 포함 2~8자입니다.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default))
            present(alert, animated: true)
        }
    }
}
