//
//  BookCollectionViewCell.swift
//  MINDWAY
//
//  Created by 새미 on 2023/08/14.
//

import UIKit
import SnapKit
import Then

class BookCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "BookCell"
    
    // MARK: - Properties
    let bookNumberLabel = UILabel().then {
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
    
    let bookTitleLabel = UILabel().then {
        $0.font = UIFont.appleSDGothicNeoFont(size: 15, family: .Regular)
        $0.textColor = .black
    }
    
    let writerLabel = UILabel().then {
        $0.font = UIFont.appleSDGothicNeoFont(size: 12, family: .Regular)
        $0.textColor = .gray
    }
    
    let linkImage = UIImageView().then {
        $0.image = UIImage(named: "link")
    }
    
    // MARK: - LifeCycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Congigure UI
    func configureUI() {
        backgroundColor = .white
        
        addView()
        setLayout()
    }
    
    // MARK: - Add View
    func addView() {
        [bookTitleLabel, writerLabel].forEach { self.bookTitleAndWriterStacView.addArrangedSubview($0) }
        [bookNumberLabel, bookTitleAndWriterStacView, linkImage].forEach { self.contentView.addSubview($0) }
    }
    
    // MARK: - Layout
    func setLayout() {
        bookNumberLabel.snp.makeConstraints {
            $0.top.equalTo(self.contentView.snp.top).offset(7)
            $0.leading.equalTo(self.contentView.snp.leading)
        }
        
        bookTitleLabel.snp.makeConstraints {
            $0.height.equalTo(18)
        }
        
        writerLabel.snp.makeConstraints {
            $0.height.equalTo(14)
        }
        
        bookTitleAndWriterStacView.snp.makeConstraints {
            $0.leading.equalTo(self.bookNumberLabel.snp.trailing).offset(17)
            $0.top.equalTo(self.contentView.snp.top).offset(7)
            $0.bottom.equalTo(self.contentView.snp.bottom)
        }
        
        linkImage.snp.makeConstraints {
            $0.top.equalTo(self.contentView.snp.top)
            $0.trailing.equalTo(self.contentView.snp.trailing)
            $0.height.width.equalTo(30)
        }
    }
}
