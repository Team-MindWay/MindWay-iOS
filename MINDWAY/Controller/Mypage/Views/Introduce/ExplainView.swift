//
//  ExplainView.swift
//  MINDWAY
//
//  Created by 신아인 on 2023/07/15.
//

import UIKit

class ExplainView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let backLogoImage = UIImageView().then {
        $0.image = UIImage(named: "bookLogo")
    }
    
    let mainLabel = UILabel().then {
        $0.text = """
                  도서부원이 추천하는 책과 도서실 이벤트를
                  모두 한 페이지에서 확인할 수 있어요.
                  도서부원이 추천하는 숨은 재미있는 책을
                  빌려 볼 수 있습니다.
                  친구들과 함께 독서에 관심을 가지고,
                  GSM 독서왕이 되어 보는 건 어떨까요?
                  마인드웨이가 여러분의 건강한 독서습관을 응원합니다!
                  """
        $0.font = UIFont.appleSDGothicNeoFont(size: 12, family: .Regular)
        $0.numberOfLines = 7
        $0.setLineSpacing(spacing: 15)
        $0.textAlignment = .center
    }
    
    private func addView(){
        [backLogoImage, mainLabel].forEach { self.addSubview($0) }
    }
    
    private func setLayout() {
        backLogoImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        mainLabel.snp.makeConstraints {
            $0.top.equalTo(backLogoImage.snp.top).offset(30)
            $0.centerX.equalTo(backLogoImage)
        }
    }
}
