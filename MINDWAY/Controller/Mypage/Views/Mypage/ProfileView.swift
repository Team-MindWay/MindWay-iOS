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
    
    let profileImage = UIImageView().then {
        $0.image = UIImage(named: "profile")
        $0.layer.shadowOpacity = 0.25
        $0.layer.shadowRadius = 5
        $0.layer.shadowOffset = CGSize(width: 1, height: 2)
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
        [profileImage, classNumLabel, nameNumLabel].forEach { self.addSubview($0) }
    }
    
    private func setLayout() {
        profileImage.snp.makeConstraints {
            $0.width.height.equalTo(127)
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        classNumLabel.snp.makeConstraints {
            $0.top.equalTo(profileImage.snp.bottom).offset(13)
            $0.centerX.equalTo(profileImage)
        }
        nameNumLabel.snp.makeConstraints {
            $0.top.equalTo(classNumLabel.snp.bottom).offset(5)
            $0.centerX.equalTo(profileImage)
        }
    }
}

