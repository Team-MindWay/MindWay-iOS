//
//  MainViewController.swift
//  MINDWAY
//
//  Created by 김주은 on 2023/07/13.
//

import UIKit

class MainViewController: BaseViewController {
    
    private let subTitleLabel = UILabel().then {
        $0.text = "Event"
        $0.font = UIFont.appleSDGothicNeoFont(size: 10, family: .Regular)
        $0.textColor = .lightGreen
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "이달의 이벤트"
        $0.font = UIFont.appleSDGothicNeoFont(size: 20, family: .Bold)
    }
    
    private let eventImage = UIImageView().then {
        $0.image = UIImage(named: "event")
        $0.layer.shadowColor = UIColor.shadowGray.cgColor
        $0.layer.shadowOpacity = 1
        $0.layer.shadowRadius = 10
        $0.layer.shadowOffset = CGSize(width: 1, height: 2)
        $0.layer.cornerRadius = 15
        $0.clipsToBounds = true
    }
    
    private let eventTitleLabel = UILabel().then {
        $0.text = "가을 독서 행사"
        $0.font = UIFont.appleSDGothicNeoFont(size: 16, family: .Bold)
    }
    
    private let eventDetailLabel = UILabel().then {
        $0.text = "독서의 계절, 가을을 맞아 도서관에서 특별한 이벤트를\n준비했습니다. 랜덤으로 초성 책 제목이 적혀있는 쪽지를 뽑고,\n그에 맞는 책을 찾아오면 푸짐한 선물뽑기를 할 수 있습니다.\n점심시간마다 진행할 예정이니 많은 관심 바랍니다."
        $0.numberOfLines = 4
        $0.setLineSpacing(spacing: 14)
        $0.font = UIFont.appleSDGothicNeoFont(size: 12, family: .Regular)
        $0.lineBreakMode = .byTruncatingTail
    }
    
    private let eventDateLabel = UILabel().then {
        $0.text = "2023년 6월 20일"
        $0.font = UIFont.appleSDGothicNeoFont(size: 12, family: .Regular)
        $0.textColor = .black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func addView() {
        [topLogoImage, subTitleLabel, titleLabel, eventImage, eventTitleLabel, eventDetailLabel, eventDateLabel].forEach {
            view.addSubview($0)
        }
    }
    
    override func setLayout() {
        topLogoImage.snp.makeConstraints {
            $0.width.equalTo(48)
            $0.height.equalTo(70)
            $0.top.equalToSuperview().offset((bounds.height)/21.1)
            $0.centerX.equalToSuperview()
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.bottom.equalTo(titleLabel.snp.top).inset(0)
            $0.left.equalToSuperview().offset((bounds.height)/6.02857142857)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset((bounds.height)/6.59375)
            $0.centerX.equalToSuperview()
        }
        
        eventImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset((bounds.height)/4.6629834254)
            $0.left.equalToSuperview().offset((bounds.height)/25.5757575758)
            $0.right.equalToSuperview().inset((bounds.height)/25.5757575758)
            $0.bottom.equalToSuperview().inset((bounds.height)/2.1152882206)
        }
        
        eventTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset((bounds.height)/1.8072805139)
            $0.left.equalToSuperview().offset((bounds.height)/15.9245283019)
        }
        
        eventDetailLabel.snp.makeConstraints {
            $0.top.equalTo(eventTitleLabel.snp.bottom).offset((bounds.height)/42.2)
            $0.left.equalToSuperview().offset((bounds.height)/15.9245283019)
            $0.right.equalToSuperview().inset((bounds.height)/25.5757575758)
        }
        
        eventDateLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset((bounds.height)/14.5517241379)
            $0.top.equalTo(eventDateLabel.snp.bottom).offset((bounds.height)/12.0571428574)
            $0.left.equalToSuperview().offset((bounds.height)/15.9245283019)
            
        }
    }
}
