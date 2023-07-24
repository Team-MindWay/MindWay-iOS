//
//  TextFieldView.swift
//  MINDWAY
//
//  Created by 새미 on 2023/07/13.
//

import UIKit
import SnapKit
import Then

final class TextFieldView: UIView {
    // MARK: - Properties
    let titleLabel = UILabel().then {
        $0.font = UIFont.appleSDGothicNeoFont(size: 16, family: .Regular)
        $0.textColor = .black
    }

    let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 274, height: 54)).then {
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
    
   let errorLabel = UILabel().then {
        $0.textColor = .red
        $0.font = UIFont.appleSDGothicNeoFont(size: 10, family: .Regular)
        $0.isHidden = true
    }
    
    // MARK: - LifeCycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    convenience init(title: String, placeholder: String) {
        self.init(frame: .zero)
        self.titleLabel.text = title
        self.textField.placeholder = placeholder
        self.errorLabel.text = "\(title) 입력은 필수입니다."
        
        self.textField.delegate = self
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
        [titleLabel, textField, errorLabel].forEach {
            self.addSubview($0)
        }
    }
    
    // MARK: - Setting Layout
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.height.equalTo(19)
        }
        
        textField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(7)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(54)
        }
        
        errorLabel.snp.makeConstraints {
            $0.top.equalTo(textField.snp.bottom).offset(4)
            $0.bottom.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
    }

}
    
extension TextFieldView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.tintColor = .systemBlue
        return true
    }
}
