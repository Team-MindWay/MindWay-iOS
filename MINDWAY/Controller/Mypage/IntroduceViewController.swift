//
//  IntroduceViewController.swift
//  MINDWAY
//
//  Created by 신아인 on 2023/07/13.
//

import UIKit

class IntroduceViewController: BaseViewController {
    
    private let titleView = TitleView()
    
    private let explainView = ExplainView()
    
    private let topGradationView = TopGradientView()
    
    private let teamMember = TeamLabelView()
    
    private let copyrightLabel = UILabel().then {
        $0.text = "© 2022. MINDWAY All rights reserved."
        $0.textColor = UIColor.gray
        $0.font = UIFont.appleSDGothicNeoFont(size: 10, family: .Regular)
    }
    
    override func addView() {
        [topLogoImage, titleView, explainView, topGradationView, teamMember, copyrightLabel].forEach{view.addSubview($0)}
    }
    
    override func setLayout() {
        topLogoImage.snp.makeConstraints {
            $0.width.equalTo(48)
            $0.height.equalTo(70)
            $0.top.equalToSuperview().inset(40)
            $0.centerX.equalToSuperview()
        }
        titleView.snp.makeConstraints {
            $0.top.equalTo(topLogoImage.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
        }
        explainView.snp.makeConstraints {
            $0.top.equalTo(titleView.titleLabel.snp.bottom).offset(70)
            $0.centerX.equalToSuperview()
        }
        topGradationView.snp.makeConstraints {
            $0.height.equalTo(20)
            $0.top.equalTo(explainView.mainLabel.snp.bottom).offset(35)
            $0.leading.trailing.equalToSuperview().inset(33)
        }
        teamMember.snp.makeConstraints {
            $0.top.equalTo(topGradationView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(115)
            //$0.leading.trailing.equalToSuperview().inset(99)
        }
        copyrightLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(120)
            $0.centerX.equalToSuperview()
        }
    }
}
