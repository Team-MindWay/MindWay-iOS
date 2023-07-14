//
//  BookListTableViewCell.swift
//  MINDWAY
//
//  Created by 새미 on 2023/07/14.
//

import UIKit
import SnapKit
import Then

class BookListTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let BookListTableViewCellIdentifier = "bookListCell"
    
    var requestBook: Book?{
        didSet{
            guard var requestBook = requestBook else { return }
            bookTitle.text = requestBook.bookTitle
            writer.text = requestBook.writer
        }
    }
    
    lazy var stackView = UIStackView().then {
        $0.spacing = 15
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.alignment = .fill
    }
    
    let bookNumber = UILabel().then {
        $0.font = UIFont.appleSDGothicNeoFont(size: 15, family: .Regular)
        $0.textColor = .black
        $0.text = "1"
    }
    
    lazy var bookTitleAndWriterStacView = UIStackView().then {
        $0.spacing = 5
        $0.axis = .vertical
        $0.distribution = .fill
        $0.alignment = .fill
    }
    
    let bookTitle = UILabel().then {
        $0.font = UIFont.appleSDGothicNeoFont(size: 15, family: .Regular)
        $0.textColor = .black
    }
    
    let writer = UILabel().then {
        $0.font = UIFont.appleSDGothicNeoFont(size: 12, family: .Regular)
        $0.textColor = .gray
    }
    
    let linkImage = UIImageView().then {
        $0.image = UIImage(named: "link")
    }
    
    // MARK: - LifeCycles
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Congigure UI
    func configureUI() {
        addView()
        setLayout()
    }
    
    // MARK: - Add View
    func addView() {
        self.addSubview(stackView)
        
        [bookTitle, writer].forEach { self.bookTitleAndWriterStacView.addArrangedSubview($0) }
        [bookNumber, bookTitleAndWriterStacView, linkImage].forEach { self.stackView.addArrangedSubview($0) }
    }
    
    // MARK: - Setting Layout
    func setLayout() {
        
        stackView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    
}
