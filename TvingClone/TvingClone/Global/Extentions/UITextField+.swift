//
//  UITextField+.swift
//  TvingClone
//
//  Created by 김나연 on 4/24/25.
//

import UIKit

extension UITextField {
    /// placeholder 색 바꾸기
    func setPlaceholderColor(_ placeholderColor: UIColor) {
        attributedPlaceholder = NSAttributedString(
            string: placeholder ?? "",
            attributes: [
                .foregroundColor: placeholderColor,
                .font: font
            ].compactMapValues { $0 }
        )
    }
    
    /// 텍스트 clear 버튼
    func setClearButton(with image: UIImage, mode: UITextField.ViewMode) {
        let clearButton = UIButton(type: .custom)
        clearButton.setImage(image, for: .normal)
        clearButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        clearButton.contentMode = .scaleAspectFit
        clearButton.addTarget(self, action: #selector(UITextField.clear(sender:)), for: .touchUpInside)
        let container = UIView(frame: CGRect(x: 0, y: 0, width: 36, height: 36))
        clearButton.center = container.center
        container.addSubview(clearButton)
        self.addTarget(self, action: #selector(UITextField.displayClearButtonIfNeeded), for: .editingChanged)
        self.rightView = container
        self.rightViewMode = mode
    }
    
    @objc
    private func displayClearButtonIfNeeded() {
        self.rightView?.isHidden = (self.text?.isEmpty) ?? true
    }
    
    @objc
    private func clear(sender: AnyObject) {
        self.text = ""
        sendActions(for: .editingChanged)
    }
    
    func setPasswordRightButtons(mode: UITextField.ViewMode) {
        
        self.isSecureTextEntry = true
        
        /// 가시화 버튼
        let eyeButton = UIButton(type: .custom)
        let eyeAction = UIAction(handler: { [weak self, weak eyeButton] _ in
            guard let tf = self, let eye = eyeButton else { return }
            let currentText = tf.text ?? ""
            let currentFont = tf.font!
            tf.isSecureTextEntry.toggle()
            
            tf.attributedText = NSAttributedString(
                string: currentText,
                attributes: [.font: currentFont]
            )
            eye.isSelected.toggle()
        })
        eyeButton.addAction(eyeAction, for: .touchUpInside)
        eyeButton.frame = CGRect(x: 44, y: 8, width: 20, height: 20)
        eyeButton.setImage(UIImage(named: "InvisibleIcon"), for: .normal)
        eyeButton.setImage(UIImage(named: "VisibleIcon"), for: .selected)
        eyeButton.tintColor = UIColor.gray2

        
        /// 클리어 버튼
        let clearButton = UIButton(type: .custom)
        clearButton.setImage(UIImage(named: "DeleteIcon"), for: .normal)
        clearButton.frame = CGRect(x: 8, y: 8, width: 20, height: 20)
        clearButton.addTarget(self, action: #selector(UITextField.clear(sender:)), for: .touchUpInside)
        self.addTarget(self, action: #selector(UITextField.displayClearButtonIfNeeded), for: .editingChanged)
        
        let container = UIView(frame: CGRect(x: 0, y: 0, width: 88, height: 36))
        container.addSubview(clearButton)
        container.addSubview(eyeButton)
        self.rightView = container
        self.rightViewMode = mode
        eyeButton.isHidden = true
        self.addTarget(self, action: #selector(showEyeButton), for: .editingDidBegin)
        self.addTarget(self, action: #selector(hideEyeButton), for: .editingDidEnd)
    }
    @objc private func showEyeButton() {
        guard let eyeButton = rightView?.subviews.last as? UIButton else { return }
        eyeButton.isHidden = false
    }

    @objc private func hideEyeButton() {
        guard let eyeButton = rightView?.subviews.last as? UIButton else { return }
        eyeButton.isHidden = true
    }
}
