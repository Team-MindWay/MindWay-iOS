//
//  MainLabelView.swift
//  MINDWAY
//
//  Created by 새미 on 2023/07/13.
//

import UIKit
import SnapKit
import Then

class MainLabelView: UIView {
    // MARK: - Properties
    private let stackView = UIStackView().then {
        $0.spacing = 0
        $0.axis = .vertical
        $0.distribution = .fill
        $0.alignment = .leading
    }
    
    private let newLabel = UILabel().then {
        $0.text = "new"
        $0.font = UIFont.appleSDGothicNeoFont(size: 15, family: .Regular)
        $0.textColor = UIColor(named: "lightGreen")
    }

    private let mainLabel = UILabel().then {
        $0.text = "도서 신청"
        $0.font = UIFont.appleSDGothicNeoFont(size: 20, family: .Bold)
        $0.textColor = .black
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
        self.addSubview(stackView)
        [newLabel, mainLabel].forEach { self.stackView.addArrangedSubview($0) }
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

