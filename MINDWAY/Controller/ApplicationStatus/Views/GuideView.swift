//
//  GuideView.swift
//  MINDWAY
//
//  Created by 새미 on 2023/07/14.
//

import UIKit
import SnapKit
import Then

final class GuideView: UIView {
    // MARK: - Properties
    let numberLabel = UILabel().then {
        $0.text = "순번"
        $0.textColor = .black
        $0.font = UIFont.appleSDGothicNeoFont(size: 10, family: .Regular)
    }
    
    let bookTitleAndWriterLabel = UILabel().then {
        $0.text = "책 제목 & 저자"
        $0.textColor = .black
        $0.font = UIFont.appleSDGothicNeoFont(size: 10, family: .Regular)
    }
    
    let linkLabel = UILabel().then {
        $0.text = "링크"
        $0.textColor = .black
        $0.font = UIFont.appleSDGothicNeoFont(size: 10, family: .Regular)
    }
    
    // MARK: - LifeCycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Configure
    private func configureUI() {
        addView()
        setLayout()
    }
    
    // MARK: - addView
    private func addView() {
        [numberLabel, bookTitleAndWriterLabel, linkLabel].forEach { self.addSubview($0) }
    }
    
    // MARK: - Setting Layout
    private func setLayout() {
        numberLabel.snp.makeConstraints {
            $0.top.bottom.leading.equalToSuperview()
            $0.width.equalTo(18)
        }
        
        bookTitleAndWriterLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(numberLabel.snp.trailing).offset(10)
            $0.width.equalTo(58)
        }
        
        linkLabel.snp.makeConstraints {
            $0.top.bottom.trailing.equalToSuperview()
            $0.leading.equalTo(bookTitleAndWriterLabel.snp.trailing).offset(157)
        }
    }
    
}
