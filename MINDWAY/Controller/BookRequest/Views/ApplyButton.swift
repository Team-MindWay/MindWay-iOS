//
//  ApplyButton.swift
//  MINDWAY
//
//  Created by 새미 on 2023/07/13.
//

import UIKit
import SnapKit
import Then

final class ApplyButton: UIButton {
    
    // MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setButton()
        self.isEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setting Button
    func setButton() {
        setTitle("신청하기", for: .normal)
        setTitleColor(.green, for: .normal)
        layer.cornerRadius = 15
        clipsToBounds = true
        titleLabel?.font = UIFont.appleSDGothicNeoFont(size: 10, family: .Regular)
        backgroundColor = .clear
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGreen.cgColor
    }
    
}
