//
//  TitleView.swift
//  MINDWAY
//
//  Created by 신아인 on 2023/07/15.
//

import UIKit

class TitleView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addView()
        setLayout()
    }
    
    let subTitleLabel = UILabel().then {
        $0.text = "스마트한 도서실 알리미,"
        $0.font = UIFont.appleSDGothicNeoFont(size: 15, family: .Medium)
    }
    
    let titleLabel = UILabel().then {
        $0.text = "GSM 도서실 종합 서비스 입니다"
        $0.font = UIFont.appleSDGothicNeoFont(size: 20, family: .Bold)
    }
    
    private func addView(){
        [subTitleLabel, titleLabel].forEach { self.addSubview($0) }
    }
    
    private func setLayout() {
        subTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(15)
            $0.centerX.equalTo(subTitleLabel)
        }
    }
}
