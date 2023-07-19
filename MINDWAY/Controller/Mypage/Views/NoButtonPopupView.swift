//
//  NoButtonPopupView.swift
//  MINDWAY
//
//  Created by 신아인 on 2023/07/19.
//

import UIKit
import SnapKit
import Then

class NoButtonPopupView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let popupView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
    }
    
    let titleLabel = UILabel().then {
        $0.font = UIFont.appleSDGothicNeoFont(size: 12, family: .Regular)
    }
    
    let box = UIStackView().then {
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = 5
    }
    
    var selectBookLabel = UILabel().then {
        $0.font = UIFont.appleSDGothicNeoFont(size: 10, family: .Regular)
    }
    
    private func addView() {
        addSubview(popupView)
        backgroundColor = .black.withAlphaComponent(0.3)
        [titleLabel, box].forEach{popupView.addSubview($0)}
        box.addSubview(selectBookLabel)
    }
    
    private func setLayout() {
        popupView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(346)
            $0.leading.trailing.equalToSuperview().inset(43)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(popupView.snp.top).offset(46)
            $0.centerX.equalTo(popupView)
        }
        box.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(popupView).inset(50)
            $0.bottom.equalTo(popupView.snp.bottom).inset(44)
        }
        selectBookLabel.snp.makeConstraints {
            $0.centerX.centerY.equalTo(box)
        }
    }
}
