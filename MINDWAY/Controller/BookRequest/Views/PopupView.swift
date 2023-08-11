//
//  PopupView.swift
//  MINDWAY
//
//  Created by 새미 on 2023/07/24.
//

import UIKit
import SnapKit
import Then

final class PopupView: UIView {
    
    // MARK: - Properties
    private let popupView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
    }
    
    private let mainLabel = UILabel().then {
        $0.text = "도서 신청이 완료되었습니다."
        $0.textColor = .black
        $0.font = UIFont.appleSDGothicNeoFont(size:12, family: .Regular)
    }
    
    private let bookTitleBackground = UIView().then {
        $0.backgroundColor = .whiteBackground
        $0.layer.cornerRadius = 5
        $0.clipsToBounds = true
    }
    
    lazy var bookTitle = UILabel().then {
        $0.textColor = .black
        $0.font = UIFont.appleSDGothicNeoFont(size:10, family: .Regular)
    }
    
    // MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setPopup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setting Popup
    func setPopup() {
        addView()
        setLayout()
    }
    
    // MARK: - addView
    func addView() {
        self.bookTitleBackground.addSubview(bookTitle)
        [mainLabel, bookTitleBackground].forEach { self.popupView.addSubview($0) }
        self.addSubview(popupView)
    }
    
    // MARK: - Setting Layout
    func setLayout() {
        popupView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(346)
            $0.leading.trailing.equalToSuperview().inset(43)
        }
        
        mainLabel.snp.makeConstraints {
            $0.top.equalTo(popupView.snp.top).offset(46)
            $0.centerX.equalToSuperview()
        }
        
        bookTitleBackground.snp.makeConstraints {
            $0.top.equalTo(mainLabel.snp.bottom).offset(18)
            $0.bottom.equalToSuperview().inset(44.4)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(202.93405)
            $0.height.equalTo(29.08541)
        }
        
        bookTitle.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
}

