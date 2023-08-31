//
//  MypageViewContoller.swift
//  MINDWAY
//
//  Created by 신아인 on 2023/07/13.
//

import UIKit

class MypageViewContoller: BaseViewController {
    
    private let viewModel = MypageViewModel()
    
    var popupVC: PopupViewController?
    
    private let logoutButton = UIButton().then {
        $0.setTitle("로그아웃", for: .normal)
        $0.setTitleColor(UIColor.red, for: .normal)
        $0.titleLabel?.font = UIFont.appleSDGothicNeoFont(size: 10, family: .Light)
    }
    
    let profileImage = UIImageView().then {
        $0.image = UIImage(named: "profile")
        $0.layer.shadowOpacity = 0.25
        $0.layer.shadowRadius = 5
        $0.layer.shadowOffset = CGSize(width: 1, height: 2)
    }
    
    private let profileLabelView = ProfileView()
    
    private let listGuideView = ListGuideView()
    
    private let topGradationView = TopGradientView()
    
    private let historyCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.isScrollEnabled = true
        $0.backgroundColor = .clear
    }
    
    private let bottomGradationView = BottomGradientView()
    
    private let introduceButton = UIButton().then {
        $0.setTitle("MINDWAY를 소개합니다!", for: .normal)
        $0.setTitleColor(UIColor.green, for: .normal)
        $0.titleLabel?.font = UIFont.appleSDGothicNeoFont(size: 12, family: .Regular)
        $0.setUnderline()
    }
    
    override func addTarget() {
        introduceButton.addTarget(self, action: #selector(goIntroduce), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchData()
        historyCollectionView.delegate = self
        historyCollectionView.dataSource = self
        historyCollectionView.register(HistoryCollectionViewCell.self, forCellWithReuseIdentifier: HistoryCollectionViewCell.identifier)
        historyCollectionView.reloadData()
    }
    
    override func addView() {
        [topLogoImage, logoutButton, profileImage, profileLabelView, listGuideView, topGradationView, historyCollectionView, bottomGradationView, introduceButton].forEach{view.addSubview($0)}
    }
    
    override func setLayout() {
        topLogoImage.snp.makeConstraints {
            $0.width.equalTo(48)
            $0.height.equalTo(70)
            $0.top.equalTo(self.view.safeAreaInsets).offset(self.view.bounds.height * 0.045)
            $0.centerX.equalToSuperview()
        }
        logoutButton.snp.makeConstraints {
            //$0.top.equalToSuperview().inset(84)
            $0.top.equalTo(topLogoImage.snp.bottom).offset(-self.view.bounds.height * 0.035)
            $0.trailing.equalToSuperview().inset(33)
        }
        profileImage.snp.makeConstraints {
            $0.width.equalToSuperview().multipliedBy(0.32)
            $0.height.equalTo(profileImage.snp.width)
            $0.top.equalTo(logoutButton.snp.bottom).offset(self.view.bounds.height * 0.01)
            $0.centerX.equalToSuperview()
        }
        profileLabelView.snp.makeConstraints {
            $0.top.equalTo(profileImage.snp.bottom).offset(13)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(profileImage.snp.width).multipliedBy(0.01)
        }
        listGuideView.snp.makeConstraints {
            $0.height.equalTo(13)
            $0.top.equalTo(profileLabelView.nameNumLabel.snp.bottom).offset(26)
            $0.leading.trailing.equalToSuperview().inset(65)
        }
        topGradationView.snp.makeConstraints {
            $0.height.equalTo(20)
            $0.top.equalTo(listGuideView.snp.bottom).offset(17)
            $0.leading.trailing.equalToSuperview().inset(33)
        }
        historyCollectionView.snp.makeConstraints {
            $0.top.equalTo(topGradationView.snp.bottom).offset(17)
            $0.leading.trailing.equalToSuperview().inset(33)
            $0.bottom.equalTo(bottomGradationView.snp.top).offset(-17)
        }
        bottomGradationView.snp.makeConstraints {
            $0.height.equalTo(20)
            $0.bottom.equalTo(introduceButton.snp.top).offset(-14)
            $0.leading.trailing.equalToSuperview().inset(33)
        }
        introduceButton.snp.makeConstraints {
            //$0.bottom.equalToSuperview().inset(110)
            $0.bottom.equalToSuperview().multipliedBy(0.87)
            $0.centerX.equalToSuperview()
        }
    }
    
    @objc func goIntroduce() {
        let nextVC = IntroduceViewController()
        self.navigationController?.pushViewController(nextVC, animated: false)
    }
    
    @objc func deletePopup(_ sender: UIButton) {
        let cellIndex = sender.tag
        guard cellIndex < viewModel.data.count else {
            return
        }
        let historyItem = viewModel.data[cellIndex]
        
        let popupVC = PopupViewController()
        popupVC.boxInBookName = historyItem.bookName
        popupVC.modalPresentationStyle = .overFullScreen
        
        popupVC.onDelete = { [weak self] bookNameToDelete in
            self?.viewModel.deleteBook(withName: bookNameToDelete)
            self?.historyCollectionView.reloadData()
        }
        
        self.present(popupVC, animated: false)
    }
}

extension MypageViewContoller: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "historyCell", for: indexPath) as? HistoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.backgroundColor = .white
        let maxLabelLength = 17
        let historyItem = viewModel.data[indexPath.item]
        cell.bookName.text = historyItem.bookName
        cell.author.text = historyItem.author
        
        cell.bookName.bookReadMore(maxLength: maxLabelLength)
        cell.author.bookReadMore(maxLength: maxLabelLength)
        
        cell.deleteButton.tag = indexPath.item
        cell.deleteButton.addTarget(self, action: #selector(deletePopup), for: .touchUpInside)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.bounds.width - 60
        let cellHeight: CGFloat = 37
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
}
