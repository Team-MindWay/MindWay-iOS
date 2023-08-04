//
//  ProfileView.swift
//  MINDWAY
//
//  Created by 신아인 on 2023/07/15.
//

import UIKit
import SnapKit
import Then

class ProfileView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let classNumLabel = UILabel().then {
        $0.text = "3409"
        $0.font = UIFont.appleSDGothicNeoFont(size: 17, family: .Regular)
    }
    
    let nameNumLabel = UILabel().then {
        $0.text = "양세련"
        $0.font = UIFont.appleSDGothicNeoFont(size: 20, family: .Bold)
    }
    
    private func addView(){
        [classNumLabel, nameNumLabel].forEach { self.addSubview($0) }
    }
    
    private func setLayout() {
        classNumLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        nameNumLabel.snp.makeConstraints {
            $0.top.equalTo(classNumLabel.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
        }
    }
}

