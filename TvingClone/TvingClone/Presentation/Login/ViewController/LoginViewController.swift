//
//  ViewController.swift
//  TvingClone
//
//  Created by 김나연 on 4/24/25.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    // MARK: - Property
    
    /// 제목
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.attributedText = NSAttributedString.pretendardStyled(
            "TVING ID 로그인",
            size: 23,
            weight: .medium
        )
        return label
    }()
    
    /// 아이디, 비밀번호
    private lazy var idTextField: UITextField = {
        let textField = UITextField()
        textField.attributedText = NSAttributedString.pretendardStyled(
            "아이디",
            size: 15,
            weight: .semibold
        )
        textField.backgroundColor = UIColor.gray4
        textField.setPlaceholderColor(UIColor.gray2)
        textField.textColor = UIColor.gray2
        
        /// 패딩 설정
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 22, height: 52))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        /// 둥근 모서리
        textField.layer.cornerRadius = 3
        textField.clipsToBounds = true
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.attributedText = NSAttributedString.pretendardStyled(
            "비밀번호",
            size: 15,
            weight: .semibold
        )
        textField.backgroundColor = UIColor.gray4
        textField.setPlaceholderColor(UIColor.gray2)
        textField.textColor = UIColor.gray2
        
        /// 패딩 설정
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 22, height: 52))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        /// 둥근 모서리
        textField.layer.cornerRadius = 3
        textField.clipsToBounds = true
        return textField
    }()
    
    /// 버튼
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.black
        button.setTitleColor(UIColor.gray2, for: .normal)
        button.setAttributedTitle(
            NSAttributedString.pretendardStyled(
                "로그인하기",
                size: 14,
                weight: .semibold
            ),
            for: .normal)
        
        /// 둥근 모서리
        button.layer.cornerRadius = 3
        button.clipsToBounds = true
        
        /// 테두리
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray4.cgColor
        return button
    }()
    
    private lazy var findIdButton: UIButton = {
        let button = UIButton(type: .system)
        button.setAttributedTitle(
            NSAttributedString.pretendardStyled(
                "아이디 찾기",
                size: 14,
                weight: .semibold
            ),
            for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    // TODO: - 나중에 width=1, height=12 지정하기
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.gray4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var findPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setAttributedTitle(
            NSAttributedString.pretendardStyled(
                "비밀번호 찾기",
                size: 14,
                weight: .semibold
            ),
            for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    private lazy var findAccountLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.gray3
        label.textAlignment = .center
        label.attributedText = NSAttributedString.pretendardStyled(
            "아직 계정이 없으신가요?",
            size: 14,
            weight: .semibold
        )
        return label
    }()
    
    private lazy var createNicknameButton: UIButton = {
        let button = UIButton(type: .system)
        button.setAttributedTitle(
            NSAttributedString.pretendardStyled(
                "닉네임 만들러가기",
                size: 14,
                weight: .regular
            ),
            for: .normal)
        button.setUnderline()
        button.backgroundColor = .clear
        return button
    }()
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.self.backgroundColor = UIColor.black
    }
}

