//
//  ListGuideView.swift
//  MINDWAY
//
//  Created by 신아인 on 2023/07/15.
//

import UIKit
import SnapKit
import Then

class ListGuideView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let bookListLabel = UILabel().then {
        $0.text = "책 제목 & 저자"
        $0.font = UIFont.appleSDGothicNeoFont(size: 10, family: .Regular)
    }
    
    let editLabel = UILabel().then {
        $0.text = "수정"
        $0.font = UIFont.appleSDGothicNeoFont(size: 10, family: .Regular)
    }
    
    let deleteLabel = UILabel().then {
        $0.text = "삭제"
        $0.font = UIFont.appleSDGothicNeoFont(size: 10, family: .Regular)
    }
    
    private func addView(){
        [bookListLabel, editLabel, deleteLabel].forEach { self.addSubview($0) }
    }
    
    private func setLayout() {
        bookListLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        editLabel.snp.makeConstraints {
            $0.top.equalTo(bookListLabel.snp.top)
            $0.leading.equalTo(bookListLabel.snp.trailing).offset(140)
        }
        deleteLabel.snp.makeConstraints {
            $0.top.equalTo(bookListLabel.snp.top)
            $0.leading.equalTo(editLabel.snp.trailing).offset(28)
        }
    }
}


