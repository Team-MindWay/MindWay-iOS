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
    lazy var stackView = UIStackView().then {
        $0.spacing = 7
        $0.axis = .vertical
        $0.distribution = .fill
        $0.alignment = .fill
    }
    
    lazy var titleLabel = UILabel().then {
        $0.font = UIFont.appleSDGothicNeoFont(size: 16, family: .Regular)
        $0.textColor = .black
    }

    lazy var textField = UITextField().then {
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
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(title: String, placeholder: String) {
            self.init(frame: .zero)
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
        self.addSubview(stackView)
        
        [titleLabel, textField].forEach {
            self.stackView.addArrangedSubview($0)
        }
    }
    
    // MARK: - Setting Layout
    private func setLayout() {
        stackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
    }
}
