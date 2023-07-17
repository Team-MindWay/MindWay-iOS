//
//  HistoryCollectionViewCell.swift
//  MINDWAY
//
//  Created by 신아인 on 2023/07/15.
//

import UIKit
import SnapKit
import Then

class HistoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "historyCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addView()
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let stackView = UIStackView().then {
        $0.backgroundColor = .white
        $0.alignment = .fill
    }
    
    var bookName = UILabel().then {
        $0.font = UIFont.appleSDGothicNeoFont(size: 15, family: .Regular)
    }
    
    var author = UILabel().then {
        $0.font = UIFont.appleSDGothicNeoFont(size: 12, family: .Regular)
        $0.textColor = UIColor.gray
    }
    
    let editButton = UIButton().then {
        $0.setImage(UIImage(named: "edit"), for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.masksToBounds = true
    }
    
    let deleteButton = UIButton().then {
        $0.setImage(UIImage(named: "delete"), for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.masksToBounds = true
    }
    
    private func addView() {
        addSubview(stackView)
        [bookName, author, editButton, deleteButton].forEach{stackView.addSubview($0)}
    }
    
    private func setLayout() {
        stackView.snp.makeConstraints {
            $0.width.equalTo(271)
            $0.height.equalTo(37)
            $0.centerX.centerY.equalToSuperview()
        }
        bookName.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.top)
            $0.leading.equalToSuperview()
        }
        author.snp.makeConstraints {
            $0.bottom.equalTo(stackView.snp.bottom)
            $0.leading.equalTo(bookName.snp.leading)
        }
        editButton.snp.makeConstraints {
            $0.width.height.equalTo(25)
            $0.top.equalTo(stackView.snp.top)
            $0.trailing.equalTo(deleteButton.snp.leading).offset(-18)
        }
        deleteButton.snp.makeConstraints {
            $0.width.height.equalTo(25)
            $0.top.equalTo(stackView.snp.top)
            $0.trailing.equalTo(stackView.snp.trailing)
        }
    }
}
