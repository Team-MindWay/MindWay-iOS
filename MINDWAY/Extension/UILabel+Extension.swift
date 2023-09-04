//
//  UILabel+Extension.swift
//  MINDWAY
//
//  Created by 새미 on 2023/07/08.
//

import UIKit

extension UILabel {
    
    func setLineSpacing(spacing: CGFloat) {
        guard let text = text else { return }

        let attributeString = NSMutableAttributedString(string: text)
        let style = NSMutableParagraphStyle()
        style.lineSpacing = spacing
        attributeString.addAttribute(.paragraphStyle, value: style, range: NSRange(location: 0, length: attributeString.length))
        attributedText = attributeString
    }
    
    func bookReadMore(maxLength: Int) {
        if let text = self.text, text.count > maxLength {
            let endIndex = text.index(text.startIndex, offsetBy: maxLength - 3)
            self.text = String(text[..<endIndex]) + "..."
        }
    }
}
