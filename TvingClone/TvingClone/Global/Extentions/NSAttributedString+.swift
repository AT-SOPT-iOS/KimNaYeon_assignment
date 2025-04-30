//
//  NSAttributedString+.swift
//  TvingClone
//
//  Created by 김나연 on 4/24/25.
//

import UIKit

extension NSAttributedString {
    static func pretendardStyled(
        _ text: String,
        size: CGFloat,
        weight: PretendardWeight,
        alignment: NSTextAlignment = .center
    ) -> NSAttributedString {
        let font = UIFont(name: weight.fontName, size: size) ?? .systemFont(ofSize: size)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = alignment
        paragraphStyle.minimumLineHeight = font.lineHeight * 1.6
        paragraphStyle.maximumLineHeight = font.lineHeight * 1.6
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .paragraphStyle: paragraphStyle,
            .kern: -0.5
        ]
        
        return NSAttributedString(string: text, attributes: attributes)
    }
}
enum PretendardWeight {
    case regular   // 400
    case medium    // 500
    case semibold  // 600
    case bold      // 700
    
    var fontName: String {
        switch self {
        case .regular: return "Pretendard-Regular"
        case .medium: return "Pretendard-Medium"
        case .semibold: return "Pretendard-SemiBold"
        case .bold: return "Pretendard-Bold"
        }
    }
}
