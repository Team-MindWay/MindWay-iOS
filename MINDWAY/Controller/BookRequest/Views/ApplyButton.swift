//
//  ApplyButton.swift
//  MINDWAY
//
//  Created by 새미 on 2023/07/13.
//

import UIKit
import SnapKit
import Then

class ApplyButton: UIButton {
    
    private let applyButton = UIButton().then {
        $0.setTitle("신청하기", for: .normal)
        $0.setTitleColor(UIColor(named: "green"), for: .normal)
        $0.setTitleColor(UIColor.white, for: .selected)
        $0.layer.cornerRadius = 15
        $0.clipsToBounds = true
        $0.titleLabel?.font = UIFont.appleSDGothicNeoFont(size: 10, family: .Regular)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.init(named: "lightGreen")!.cgColor
        $0.backgroundColor = UIColor.white
    }
    
}
