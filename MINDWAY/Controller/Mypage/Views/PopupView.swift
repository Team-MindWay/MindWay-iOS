//
//  PopupView.swift
//  MINDWAY
//
//  Created by 신아인 on 2023/07/18.
//

import UIKit

class PopupView: UIView {
    
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
        $0.text = "선택한 도서를 삭제하시겠습니까?"
        $0.font = UIFont.appleSDGothicNeoFont(size: 12, family: .Regular)
    }
    
    let box = UIStackView().then {
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = 5
    }
    
    var selectBookLabel = UILabel().then {
        $0.font = UIFont.appleSDGothicNeoFont(size: 10, family: .Regular)
    }
    
    let cancelButton = UIButton().then {
        $0.setTitle("취소하기", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont.appleSDGothicNeoFont(size: 12, family: .Regular)
    }
    
    let deleteButton = UIButton().then {
        $0.setTitle("삭제하기", for: .normal)
        $0.setTitleColor(.red, for: .normal)
        $0.titleLabel?.font = UIFont.appleSDGothicNeoFont(size: 12, family: .Regular)
    }
    
    private func addView() {
        addSubview(popupView)
        backgroundColor = .black.withAlphaComponent(0.3)
        [titleLabel, box, cancelButton, deleteButton].forEach{popupView.addSubview($0)}
        box.addSubview(selectBookLabel)
    }
    
    private func setLayout() {
        popupView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(346)
            $0.leading.trailing.equalToSuperview().inset(43)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(popupView.snp.top).offset(33)
            $0.centerX.equalTo(popupView)
        }
        box.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(popupView).inset(50)
            $0.bottom.equalTo(popupView.snp.bottom).inset(60)
        }
        cancelButton.snp.makeConstraints {
            $0.leading.equalTo(popupView.snp.leading).offset(56)
            $0.bottom.equalTo(popupView.snp.bottom).inset(20)
        }
        deleteButton.snp.makeConstraints {
            $0.trailing.equalTo(popupView.snp.trailing).inset(56)
            $0.bottom.equalTo(popupView.snp.bottom).inset(20)
        }
        selectBookLabel.snp.makeConstraints {
            $0.centerX.centerY.equalTo(box)
        }
    }
}
