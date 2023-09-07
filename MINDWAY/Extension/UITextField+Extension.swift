//
//  UITextField+Extension.swift
//  MINDWAY
//
//  Created by 새미 on 2023/07/08.
//

import UIKit

extension UITextField {
    
    func addShowshadow() {
        self.layer.masksToBounds = false
        self.clipsToBounds = false
        self.layer.borderWidth = 1
        self.layer.shadowOpacity = 0.25
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowRadius = 1.5
        self.layer.shadowOffset = CGSize(width: 1, height: 2)
    }
    
}
