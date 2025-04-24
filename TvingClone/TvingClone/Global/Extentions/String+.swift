//
//  String+.swift
//  TvingClone
//
//  Created by 김나연 on 4/24/25.
//
import Foundation

extension String {
    
    /// 이메일 유효성 검사
    var isValidEmail: Bool {
        let regularExpression = "^[A-Z0-9a-z._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        return predicate.evaluate(with: self)
    }
    
    /// 비밀번호 유효성 검사: 8~12자, 대소문자+숫자+특수문자 포함
    var isValidPassword: Bool {
        let regularExpression = "^(?=.*[!_@$%^&+=])[A-Za-z0-9!_@$%^&+=]{8,12}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        return predicate.evaluate(with: self)
    }
    
    /// 닉네임 유효성 검사: 2자 이상 8자 이하 한글+특수문자 포함
    var isKorean: Bool {
        let regularExpression = "^[가-힣ㄱ-ㅎㅏ-ㅣ!@#$%^&*()_+=\\-.]{2,8}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        return predicate.evaluate(with: self)
    }
}
