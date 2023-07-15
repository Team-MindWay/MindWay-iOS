//
//  MypageViewContoller.swift
//  MINDWAY
//
//  Created by 신아인 on 2023/07/13.
//

import UIKit

class MypageViewContoller: BaseViewController {
    
    private let logoutButton = UIButton().then {
        $0.setTitle("로그아웃", for: .normal)
        $0.setTitleColor(UIColor.red, for: .normal)
        $0.titleLabel?.font = UIFont.appleSDGothicNeoFont(size: 10, family: .Light)
    }
    
    private let profileView = ProfileView()
    
    private let listGuideView = ListGuideView()
    
    private let topGradationView = TopGradientView()
    
    private let bottomGradationView = BottomGradientView()
    
    private let introduceButton = UIButton().then {
        $0.setTitle("MINDWAY를 소개합니다!", for: .normal)
        $0.setTitleColor(UIColor.green, for: .normal)
        $0.titleLabel?.font = UIFont.appleSDGothicNeoFont(size: 12, family: .Regular)
        $0.setUnderline()
    }
    
    override func addTarget() {
        introduceButton.addTarget(self, action: #selector(goIntroduce), for: .touchUpInside)
    }
    
    override func addView() {
        [topLogoImage, logoutButton, profileView, listGuideView,topGradationView, bottomGradationView, introduceButton].forEach{view.addSubview($0)}
    }
    
    override func setLayout() {
        topLogoImage.snp.makeConstraints {
            $0.width.equalTo(48)
            $0.height.equalTo(70)
            $0.top.equalToSuperview().inset(40)
            $0.centerX.equalToSuperview()
        }
        logoutButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(84)
            $0.trailing.equalToSuperview().inset(33)
        }
        profileView.snp.makeConstraints {
            $0.top.equalTo(logoutButton.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        listGuideView.snp.makeConstraints {
            $0.top.equalTo(profileView.nameNumLabel.snp.bottom).offset(26)
            $0.leading.trailing.equalToSuperview().inset(61)
        }
        topGradationView.snp.makeConstraints {
            $0.height.equalTo(15)
            $0.top.equalTo(listGuideView.snp.bottom).offset(23)
            $0.leading.trailing.equalToSuperview().inset(33)
        }
        bottomGradationView.snp.makeConstraints {
            $0.height.equalTo(15)
            $0.bottom.equalTo(introduceButton.snp.top).inset(-14)
            $0.leading.trailing.equalToSuperview().inset(33)
        }
        
        introduceButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(120)
            $0.centerX.equalToSuperview()
        }
    }
    
    @objc func goIntroduce() {
        let nextVC = IntroduceViewController()
        self.navigationController?.pushViewController(nextVC, animated: false)
    }
}
