//
//  StatusButton.swift
//  MINDWAY
//
//  Created by 새미 on 2023/07/13.
//

import UIKit
import SnapKit
import Then

class StatusButton: UIButton {
    
    private let statusButton = UIButton().then {
        $0.setTitle("신청현황", for: .normal)
        $0.backgroundColor = .clear
        $0.titleLabel?.font = UIFont.appleSDGothicNeoFont(size: 12, family: .Regular)
        $0.setTitleColor(UIColor(named: "green"), for: .normal)
        $0.setUnderline()
    }
}
