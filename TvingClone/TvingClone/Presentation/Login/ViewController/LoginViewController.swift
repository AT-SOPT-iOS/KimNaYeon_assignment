//
//  ViewController.swift
//  TvingClone
//
//  Created by 김나연 on 4/24/25.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController, UITextFieldDelegate, DataBindDelegate {
    func dataBind(id: String) {
        idTextField.text = id
    }
    
    
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
        textField.placeholder = "아이디"
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 15)
        textField.backgroundColor = UIColor.gray4
        textField.setPlaceholderColor(UIColor.gray2)
        textField.textColor = UIColor.gray2
        
        /// 패딩 설정
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: 0))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        /// 둥근 모서리
        textField.layer.cornerRadius = 3
        textField.clipsToBounds = true
        
        /// 클리어 버튼
        textField.setClearButton(with: UIImage(named: "DeleteIcon") ?? UIImage(systemName: "x.circle")!, mode: .whileEditing)

        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 15)
        textField.backgroundColor = UIColor.gray4
        textField.setPlaceholderColor(UIColor.gray2)
        textField.textColor = UIColor.gray2
        
        textField.isSecureTextEntry = true
        
        /// 패딩 설정
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: 0))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        /// 둥근 모서리
        textField.layer.cornerRadius = 3
        textField.clipsToBounds = true
        
        /// 클리어 버튼
        textField.setClearButton(with: UIImage(named: "DeleteIcon") ?? UIImage(systemName: "x.circle")!, mode: .whileEditing)
        
        return textField
    }()
    
    /// 버튼
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.contentVerticalAlignment = .center
        button.backgroundColor = UIColor.black
        button.setTitleColor(UIColor.gray2, for: .normal)
        button.setTitle("로그인하기", for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        
        /// 둥근 모서리
        button.layer.cornerRadius = 3
        button.clipsToBounds = true
        
        /// 테두리
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray4.cgColor
        
        button.addTarget(self, action: #selector(loginButtonDidTapped), for: .touchUpInside)
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
        button.setTitleColor(UIColor.gray2, for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
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
        button.setTitleColor(UIColor.gray2, for: .normal)
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
        button.setTitle("닉네임 만들러가기", for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Regular", size: 14)
        button.setUnderline()
        button.setTitleColor(UIColor.gray2, for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    // MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()
        view.self.backgroundColor = UIColor.black
        addStackProperty()
        addProperty()
        makeConstraints()
        
        idTextField.delegate = self
        passwordTextField.delegate = self
        idTextField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
    }
    
    // MARK: - Stack
    private func createHorizontalStackView(_ space: CGFloat, baselineAligned: Bool = false) -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = space
        stack.alignment = baselineAligned ? .firstBaseline : .center
        return stack
    }
    
    /// 아이디, 비밀번호 찾기 스택 뷰
    private lazy var findStack: UIStackView = {
        return createHorizontalStackView(34.5)
    }()
    
    /// 닉네임 생성 스택 뷰
    private lazy var createNicknameStack: UIStackView = {
        return createHorizontalStackView(33, baselineAligned: true)
    }()
    
    // MARK: - ConstraintsFuntion
    /// 프로퍼티 뷰 추가 함수
    private func addStackProperty() {
        
        findStack.addArrangedSubview(findIdButton)
        findStack.addArrangedSubview(separatorView)
        findStack.addArrangedSubview(findPasswordButton)
        
        createNicknameStack.addArrangedSubview(findAccountLabel)
        createNicknameStack.addArrangedSubview(createNicknameButton)
    }
    
    /// 프로퍼티 추가 함수
    private func addProperty() {
        [titleLabel, idTextField, passwordTextField, loginButton, findStack, createNicknameStack].forEach {
            self.view.addSubview($0)
        }
    }
    
    /// 오토레이아웃 조정
    private func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(109.5)
            make.right.equalToSuperview().offset(-109.5)
            
            make.top.equalToSuperview().offset(90)
        }
        
        idTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.greaterThanOrEqualTo(52)
            make.top.equalToSuperview().offset(158)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.greaterThanOrEqualTo(52)
            make.top.equalToSuperview().offset(217)
        }
        
        loginButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.greaterThanOrEqualTo(52)
            make.top.equalToSuperview().offset(290)
        }
        
        findStack.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(373)
            make.centerX.equalToSuperview()
        }
        
        separatorView.snp.makeConstraints { make in
            make.width.equalTo(1)
            make.height.equalTo(12)
        }
        
        createNicknameStack.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(423)
            make.centerX.equalToSuperview()
        }
    }
    
    // TODO: - 나중에 베이스뷰컨 만들기
    /// 터치시 키보드 내려감
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - Function
    /// 텍스트필드 포커스 진입 시
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray2.cgColor
    }

    /// 텍스트필드 포커스 해제 시
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 0
        textField.layer.borderColor = nil
    }
    
    /// 버튼 활성화
    @objc private func textFieldsDidChange() {
        let isIdValid = !(idTextField.text ?? "").isEmpty
        let isPasswordValid = !(passwordTextField.text ?? "").isEmpty
        
        UIView.animate(withDuration: 0.25) {
            if isIdValid && isPasswordValid {
                self.loginButton.backgroundColor = UIColor.tvingRed
                self.loginButton.setTitleColor(.white, for: .normal)
                self.loginButton.layer.borderWidth = 0
            } else {
                self.loginButton.backgroundColor = UIColor.black
                self.loginButton.setTitleColor(.gray2, for: .normal)
                self.loginButton.layer.borderWidth = 1
            }
        }

        loginButton.isEnabled = isIdValid && isPasswordValid
        loginButton.layer.borderColor = (isIdValid && isPasswordValid) ? nil : UIColor.gray4.cgColor
    }

    // MARK: - Button Action
    private func pushToWelcomeVC(){
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.delegete = self
        welcomeViewController.id = idTextField.text
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    @objc
    private func loginButtonDidTapped(){
        pushToWelcomeVC()
    }
}
