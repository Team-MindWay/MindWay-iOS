//
//  StatusButton.swift
//  MINDWAY
//
//  Created by 새미 on 2023/07/13.
//

import UIKit
import SnapKit
import Then

final class StatusButton: UIButton {
    
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
        setTitle("신청현황", for: .normal)
        backgroundColor = .clear
        titleLabel?.font = UIFont.appleSDGothicNeoFont(size: 12, family: .Regular)
        setTitleColor(UIColor(named: "green"), for: .normal)
        setUnderline()
    }
}
