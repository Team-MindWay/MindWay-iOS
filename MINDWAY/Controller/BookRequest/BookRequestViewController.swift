//
//  BookRequestViewController.swift
//  MINDWAY
//
//  Created by 새미 on 2023/07/13.
//

import UIKit
import SnapKit
import Then

final class BookRequestViewController: BaseViewController {
    
    // MARK: - Properties
    var popupVC = PopupViewController()
    
    private let processingBar = UIImageView().then {
        $0.image = UIImage(named: "processingBar")
    }
    
    private let mainLabelView = MainLabelView()
    
    private lazy var stackView = UIStackView().then {
        $0.spacing = 2
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.alignment = .fill
    }
    
    private let bookTitleTextFieldView = TextFieldView(title: "책 제목", placeholder: "책 제목을 입력하세요")

    private let writerTextFieldView = TextFieldView(title: "저자", placeholder: "저자를 입력하세요")

    private let linkTextFieldView = TextFieldView(title: "링크", placeholder: "YES24 링크를 첨부하세요")
    
    private let applyButton = ApplyButton().then {
        $0.addTarget(self, action: #selector(applayButtonTapped), for: .touchUpInside)
    }
    
    private let statusButton = StatusButton()
    
    private let guideText = UILabel().then {
        $0.text = "신청 전에 도서관에 신청하고자 하는 책이 있는지 확인해주세요.\n부적절한 도서 신청시 통보없이 삭제되며, 후에 불이익이 있을 수 있습니다."
        $0.textColor = .gray
        $0.font = UIFont.appleSDGothicNeoFont(size: 10, family: .Light)
        $0.numberOfLines = 2
        $0.setLineSpacing(spacing: 10)
        $0.textAlignment = .center
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: Keyboard Down
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - UI Configure
    func configureUI() {
        self.view.backgroundColor = .white
        
        addView()
        setLayout()
    }
    
    // MARK: - Add View
    override func addView() {
        [topLogoImage, processingBar, mainLabelView, stackView, applyButton, statusButton, guideText].forEach {
            self.view.addSubview($0)
        }
        
        [bookTitleTextFieldView, writerTextFieldView, linkTextFieldView].forEach {
            self.stackView.addArrangedSubview($0)
        }
    }
    
    // MARK: - Layout Setting
    override func setLayout() {
        topLogoImage.snp.makeConstraints {
            $0.width.equalTo(48)
            $0.height.equalTo(70)
            $0.top.equalToSuperview().inset(40)
            $0.centerX.equalToSuperview()
        }
        
        processingBar.snp.makeConstraints {
            $0.top.equalToSuperview().inset(40)
            $0.trailing.equalTo(mainLabelView.snp.leading).offset(-112)
            $0.width.equalTo(13)
            $0.height.equalTo(408)
        }
        
        mainLabelView.snp.makeConstraints {
            $0.top.equalTo(topLogoImage.snp.bottom).offset(14)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(75)
            $0.height.equalTo(38)
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(mainLabelView.snp.bottom).offset(73)
            $0.bottom.equalTo(guideText.snp.top).offset(-171)
            $0.leading.equalTo(processingBar.snp.trailing).offset(18)
            $0.trailing.equalToSuperview().inset(53)
        }
        
        applyButton.snp.makeConstraints {
            $0.top.equalTo(self.stackView.snp.bottom).offset(36)
            $0.trailing.equalToSuperview().inset(57)
            $0.height.equalTo(29)
            $0.width.equalTo(97)
        }
        
        statusButton.snp.makeConstraints {
            $0.top.equalTo(self.applyButton.snp.bottom).offset(5)
            $0.trailing.equalToSuperview().inset(84)
            $0.width.equalTo(42)
            $0.height.equalTo(14)
        }
        
        guideText.snp.makeConstraints {
            $0.top.equalTo(self.stackView.snp.bottom).offset(155)
            $0.height.equalTo(40)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(288)
        }
        
    }
    
    @objc func applayButtonTapped() {
        var bookTitleError: Bool = false
        var writerError: Bool = false
        var linkError: Bool = false

        bookTitleError = bookTitleTextFieldView.showError()
        writerError = writerTextFieldView.showError()
        linkError = linkTextFieldView.showError()

        if !bookTitleError && !writerError && !linkError {
            let popupVC = PopupViewController()
            popupVC.modalPresentationStyle = .overFullScreen
            popupVC.bookTitle = bookTitleTextFieldView.textField.text
            self.present(popupVC, animated: false)
        }
    }

}
