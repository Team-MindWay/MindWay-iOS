//
//  TextFieldView.swift
//  MINDWAY
//
//  Created by 새미 on 2023/07/13.
//

import UIKit
import SnapKit
import Then

class TextFieldView: UIView {
    // MARK: - Properties
    private let titleLabel = UILabel().then {
        $0.font = UIFont.appleSDGothicNeoFont(size: 16, family: .Regular)
        $0.textColor = .black
    }

    private let textField = UITextField().then {
        $0.textColor = .black
        $0.tintColor = .black
        $0.font = UIFont.appleSDGothicNeoFont(size: 12, family: .Regular)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.init(named: "lightGreen")!.cgColor
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 14.0, height: 0.0))
        $0.leftViewMode = .always
        $0.layer.cornerRadius = 5
        $0.autocorrectionType = .no
        $0.spellCheckingType = .no
        $0.autocapitalizationType = .none
        $0.addShowshadow()
    }
    
    // MARK: - LifeCycles
    init(title: String, placeholder: String) {
        configureUI()
    }
    
    convenience init(title: String, placeholder: String) {
        self.titleLabel.text = title
        self.textField.placeholder = placeholder
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
        [titleLabel, textField].forEach { self.addSubview($0) }
    }
    
    // MARK: - Setting Layout
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview().inset(-61)
            $0.leading.equalToSuperview().inset(14)
            $0.trailing.equalToSuperview().inset(-214)
        }
        
        textField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(7)
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
    }
}
