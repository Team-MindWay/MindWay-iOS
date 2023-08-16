//
//  ApplicationStatusViewController.swift
//  MINDWAY
//
//  Created by 새미 on 2023/07/14.
//

import UIKit
import SnapKit
import Then

final class ApplicationStatusViewController: BaseViewController {

    // MARK: - Properties
    private let mainLabelView = MainLabelView()
    
    private let applyButton = ApplyButton()
    
    private let guideView = GuideView()
    
    private let topGradationView = TopGradationView()
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.isScrollEnabled = true
        $0.backgroundColor = .clear
    }
    
    private let bottomGradationView = BottomGradationView()
    
    var booksArray: [Book] = []
    
    var bookListManager = BookListManager()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    // MARK: - Setting
    func setup() {
        self.view.backgroundColor = .white
        
        addView()
        setLayout()
        setupCollectionView()
        setData()
    }
    
    // MARK: - Add View
    override func addView() {
        [topLogoImage, mainLabelView, applyButton, guideView, topGradationView, collectionView, bottomGradationView].forEach {
            self.view.addSubview($0)
        }
    }
    
    // MARK: - Layout Setting
    override func setLayout() {
        topLogoImage.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            $0.centerX.equalTo(self.view.snp.centerX)
            $0.height.equalTo(70.48101)
            $0.width.equalTo(48)
        }
        
        mainLabelView.snp.makeConstraints {
            $0.top.equalTo(topLogoImage.snp.bottom).offset(14)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(75)
            $0.height.equalTo(38)
        }
        
        applyButton.snp.makeConstraints {
            $0.top.equalTo(mainLabelView.snp.bottom).offset(25)
            $0.trailing.equalTo(self.view.snp.trailing).offset(-33)
            $0.width.equalTo(97)
            $0.height.equalTo(29)
        }
        
        guideView.snp.makeConstraints {
            $0.top.equalTo(applyButton.snp.bottom).offset(18)
            $0.leading.equalTo(self.view.snp.leading).offset(59)
            $0.trailing.equalTo(self.view.snp.trailing).offset(-70)
            $0.height.equalTo(12)
        }
        
        topGradationView.snp.makeConstraints {
            $0.height.equalTo(22)
            $0.leading.trailing.equalToSuperview().inset(33)
            $0.top.equalTo(guideView.snp.bottom).offset(15)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(topGradationView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(64)
            $0.height.equalTo(394)
//            $0.bottom.equalTo(bottomGradationView.snp.top).offset(-10)
        }
        
        bottomGradationView.snp.makeConstraints {
            $0.height.equalTo(22)
            $0.top.equalTo(collectionView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(33)
        }
    }
    
    // MARK: - collectionView Setting
    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(BookCollectionViewCell.self, forCellWithReuseIdentifier: BookCollectionViewCell.identifier)
    }
    
    // MARK: - Data Setting
    func setData() {
        bookListManager.makeBookListData()
        booksArray = bookListManager.getBookList()
    }
}


// MARK: - UICollectionVeiw dataSource Extension
extension ApplicationStatusViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return booksArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookCollectionViewCell.identifier, for: indexPath) as! BookCollectionViewCell
        
        cell.bookNumberLabel.text = String(booksArray[indexPath.row].bookId)
        cell.bookTitleLabel.text = booksArray[indexPath.row].bookTitle
        cell.writerLabel.text = booksArray[indexPath.row].bookWriter
        
        return cell
    }
}

// MARK: - UICollectionVeiw delegate Extension
extension ApplicationStatusViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 262, height: 44)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }

}






