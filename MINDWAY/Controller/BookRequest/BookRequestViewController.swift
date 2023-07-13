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
    private let processingBar = UIImageView().then {
        $0.image = UIImage(named: "processingBar")
    }
    
    private let mainLabelView = MainLabelView()
    
    private lazy var stackView = UIStackView().then {
        $0.spacing = 20
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.alignment = .fill
    }
    
    private let bookTitleTextFieldView = TextFieldView(title: "책 제목", placeholder: "책 제목을 입력하세요")

    private let writerTextFieldView = TextFieldView(title: "저자", placeholder: "저자를 입력하세요")

    private let linkTextFieldView = TextFieldView(title: "링크", placeholder: "YES24 링크를 첨부하세요")
    
    
    
    private let applyButton = ApplyButton()
    
    private let statusButton = StatusButton()
    
    private let guideText = UILabel().then {
        $0.text = "신청 전에 도서관에 신청하고자 하는 책이 있는지 확인해주세요.\n부적절한 도서 신청시 통보없이 삭제되며, 후에 불이익이 있을 수 있습니다."
        $0.textColor = UIColor(named: "gray")
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
    
    // MARK: - UI Configure
    func configureUI() {
        self.view.backgroundColor = .white
        
        addView()
        setLayout()
    }
    
    // MARK: - Add View
    override func addView() {
        [topLogoImage, processingBar, mainLabelView, guideText].forEach {
            self.view.addSubview($0)
        }
        
    }
    
    
    // MARK: Layout Setting
    override func setLayout() {
        topLogoImage.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-648)
            $0.centerX.equalTo(self.view.snp.centerX)
        }
        
        processingBar.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.equalTo(self.view.snp.leading).offset(33)
            $0.trailing.equalTo(self.view.snp.trailing).offset(-347)
            $0.height.equalTo(408)
        }
        
        mainLabelView.snp.makeConstraints {
            $0.top.equalTo(topLogoImage.snp.bottom).offset(14)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(75)
            $0.height.equalTo(38)
        }
        
        
        
        
    }
    

}

//MARK: - Preview

#if DEBUG
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        BookRequestViewController()
    }
}
@available(iOS 13.0, *)
struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
        }
        
    }
} #endif
