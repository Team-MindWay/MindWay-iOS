//
//  TeamLabelView.swift
//  MINDWAY
//
//  Created by 신아인 on 2023/07/17.
//

import UIKit
import SnapKit
import Then

class TeamLabelView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let iOSLabel = UILabel().then {
        $0.text = "iOS"
        $0.textAlignment = .center
        $0.font = UIFont.appleSDGothicNeoFont(size: 12, family: .semiBold)
    }
    
    private let backEndLabel = UILabel().then {
        $0.text = "Back end"
        $0.textAlignment = .center
        $0.font = UIFont.appleSDGothicNeoFont(size: 12, family: .semiBold)
    }
    
    private let uiuxLabel = UILabel().then {
        $0.text = "UI / UX"
        $0.textAlignment = .center
        $0.font = UIFont.appleSDGothicNeoFont(size: 12, family: .semiBold)
    }
    
    private let iOSTeamLabel = UILabel().then {
        $0.text = "김새미  김주은  신아인"
        $0.font = UIFont.appleSDGothicNeoFont(size: 12, family: .Regular)
    }
    
    private let backEndTeamLabel = UILabel().then {
        $0.text = "노가성  주현호"
        $0.font = UIFont.appleSDGothicNeoFont(size: 12, family: .Regular)
    }
    
    private let designerLabel = UILabel().then {
        $0.text = "양세련"
        $0.font = UIFont.appleSDGothicNeoFont(size: 12, family: .Regular)
    }
    
    private func addView(){
        [iOSLabel, backEndLabel, uiuxLabel, iOSTeamLabel, backEndTeamLabel, designerLabel].forEach { self.addSubview($0) }
    }
    
    private func setLayout() {
        iOSLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        backEndLabel.snp.makeConstraints {
            $0.top.equalTo(iOSLabel.snp.bottom).offset(20)
            $0.centerX.equalTo(iOSLabel)
        }
        uiuxLabel.snp.makeConstraints {
            $0.top.equalTo(backEndLabel.snp.bottom).offset(20)
            $0.centerX.equalTo(backEndLabel)
        }
        iOSTeamLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(iOSLabel.snp.trailing).offset(48)
        }
        backEndTeamLabel.snp.makeConstraints {
            $0.top.equalTo(iOSTeamLabel.snp.bottom).offset(20)
            $0.leading.equalTo(iOSTeamLabel.snp.leading)
        }
        designerLabel.snp.makeConstraints {
            $0.top.equalTo(backEndTeamLabel.snp.bottom).offset(20)
            $0.leading.equalTo(iOSTeamLabel.snp.leading)
        }
    }
}
