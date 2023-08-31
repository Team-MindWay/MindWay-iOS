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
        case Regular = "AppleSDGothicNeo-Regular"
        case Bold = "AppleSDGothicNeo-Bold"
        case Medium = "AppleSDGothicNeo-Medium"
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
