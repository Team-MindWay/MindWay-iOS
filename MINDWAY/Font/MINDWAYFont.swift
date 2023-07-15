//
//  MINDWAYFont.swift
//  MINDWAY
//
//  Created by 신아인 on 2023/06/30.
//

import UIKit

extension UIFont {
    
    enum Family: String {
        case Light = "AppleSDGothicNeo-Light"
        case Medium = "AppleSDGothicNeo-Medium"
        case Regular = "AppleSDGothicNeo-Regular"
        case Bold = "AppleSDGothicNeo-Bold"
    }
    
    static func appleSDGothicNeoFont(size: CGFloat = 10, family: Family = .Regular) -> UIFont {
        return UIFont(
            name: family.rawValue,
            size: size
        ) ??
        UIFont.systemFont(
            ofSize: size,
            weight: .regular
        )
    }
}
