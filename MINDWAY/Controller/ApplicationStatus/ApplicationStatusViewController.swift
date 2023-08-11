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
    
    private let tableView = UITableView()
    
    var booksArray: [Book] = []
    
    var bookListManager = BookListManager()
    
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
        setupTableView()
        setData()
    }
    
    // MARK: - Add View
    override func addView() {
        [topLogoImage, mainLabelView, applyButton, guideView, tableView].forEach {
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
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(self.guideView.snp.bottom)
            $0.height.equalTo(394)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().inset(64)
        }
    }
    
    // MARK: - setupTableView
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = 44
        tableView.separatorStyle = .none
        
        tableView.register(BookListTableViewCell.self, forCellReuseIdentifier: "BookListCell")
    }
    
    // MARK: - setData
    func setData() {
        bookListManager.makeBookListData()
        booksArray = bookListManager.getBookList()
    }
}


// MARK: - UITableView Extension
extension ApplicationStatusViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return booksArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookListCell", for: indexPath) as! BookListTableViewCell
        
        cell.bookTitleLabel.text = booksArray[indexPath.row].bookTitle
        cell.writerLabel.text = booksArray[indexPath.row].bookWriter
        
        return cell
    }

}

extension ApplicationStatusViewController: UITableViewDelegate {
    
}


