//
//  ApplyButton.swift
//  MINDWAY
//
//  Created by 새미 on 2023/07/14.
//

import UIKit
import SnapKit
import Then

final class ApplyButton: UIButton {
    
    // MARK: - LifeCycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setting Button
    func setButton() {
        setTitle("신청하기", for: .normal)
        setTitleColor(UIColor(named: "green"), for: .normal)
        setTitleColor(UIColor.white, for: .selected)
        layer.cornerRadius = 15
        clipsToBounds = true
        titleLabel?.font = UIFont.appleSDGothicNeoFont(size: 10, family: .Regular)
        layer.borderWidth = 1
        layer.borderColor = UIColor.init(named: "lightGreen")!.cgColor
        backgroundColor = UIColor.white
    }
}
