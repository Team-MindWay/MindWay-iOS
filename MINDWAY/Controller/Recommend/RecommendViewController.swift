//
//  RecommendViewController.swift
//  MINDWAY
//
//  Created by 김주은 on 2023/07/26.
//

import UIKit

class RecommendViewController: BaseViewController {
    
    private let scrollView: UIScrollView = UIScrollView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
    }

    private let stackView: UIStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 10
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    private let subTitleLabel = UILabel().then {
        $0.text = "Recommend"
        $0.font = UIFont.appleSDGothicNeoFont(size: 12, family: .Regular)
        $0.textColor = UIColor.lightGreen
    }

    private let titleLabel = UILabel().then {
        $0.text = "추천 도서"
        $0.font = UIFont.appleSDGothicNeoFont(size: 20, family: .Bold)
    }

    private lazy var segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["Novel", "Essay"])
        control.translatesAutoresizingMaskIntoConstraints = false

        return control
    }()
    
    let Novel: UIView = {
    let view = UIView()
    view.backgroundColor = .green
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
    }()
    
    let Essay: UIView = {
    let view = UIView()
    view.backgroundColor = .yellow
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
    }()

    var shouldHideFirstView: Bool? {
        didSet {
            guard let shouldHideFirstView = self.shouldHideFirstView else { return }
            self.Novel.isHidden = shouldHideFirstView
            self.Essay.isHidden = !self.Novel.isHidden
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
        
        self.segmentedControl.addTarget(self, action: #selector(didChangeValue(segment:)), for: .valueChanged)
            
        self.segmentedControl.selectedSegmentIndex = 0
        self.didChangeValue(segment: self.segmentedControl)
               
        setVerticalStackView()
    }

    private func setupViews() {
        
        [topLogoImage, subTitleLabel, titleLabel, scrollView, self.segmentedControl, stackView].forEach {
            view.addSubview($0)
        }
        
        [Novel, Essay].forEach {
            stackView.addArrangedSubview($0)
        }
        
        scrollView.addSubview(stackView)
    }

    private func setupConstraints() {
        topLogoImage.snp.makeConstraints {
            $0.width.equalTo(48)
            $0.height.equalTo(70)
            $0.top.equalToSuperview().inset(40)
            $0.centerX.equalToSuperview()
        }

        subTitleLabel.snp.makeConstraints {
            $0.bottom.equalTo(titleLabel.snp.top).inset(0)
            $0.left.equalToSuperview().offset(157)
        }

        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(130)
            $0.centerX.equalToSuperview()
        }

        segmentedControl.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(27)
            $0.left.equalToSuperview().offset(97)
            $0.right.equalToSuperview().inset(98)
            $0.height.equalTo(19)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(segmentedControl.snp.bottom).offset((bounds.height)/44.4210526316)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset((bounds.height)/14.5517241379)
            $0.left.equalTo(view.safeAreaLayoutGuide).offset(22)
            $0.right.equalTo(view.safeAreaLayoutGuide).inset(22)
        }

        stackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(21)
            $0.bottom.equalToSuperview().inset(21)
        }
    }
    
    private func setVerticalStackView() {
        stackView.axis = .vertical
        stackView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor).isActive = true
        fillStackView("vertical")
    }
        
    private func fillStackView(_ axis: String) {
        let colorArray: [UIColor] = [.green, .lightGreen, .green, .lightGreen, .green]
        
        for (index, color) in colorArray.enumerated() {
            let elementView = UIView()
            elementView.backgroundColor = color
            elementView.translatesAutoresizingMaskIntoConstraints = false
            
            let novelTitleLabel = UILabel()
            novelTitleLabel.text = "세상의 마지막 기차역"
            novelTitleLabel.font = UIFont.appleSDGothicNeoFont(size: 16, family: .Medium)
            
            let novelWriterLabel = UILabel()
            novelWriterLabel.text = "무라세 다케시"
            novelWriterLabel.font = UIFont.appleSDGothicNeoFont(size: 10, family: .Regular)
            
            let novelIntroduceLabel = UILabel()
            novelIntroduceLabel.text = "수많은 중상자를 낸 이 대형 사고 때문에 유가족은 \n 순식간에 사랑하는 가족, 연인을 잃었다."
            novelIntroduceLabel.numberOfLines = 2
            novelIntroduceLabel.font = UIFont.appleSDGothicNeoFont(size: 12, family: .Light)
            
            if index % 2 == 0 {
                novelTitleLabel.textColor = .white
                novelWriterLabel.textColor = .white
                novelIntroduceLabel.textColor = UIColor(red: 0.78, green: 0.78, blue: 0.78, alpha: 1.0)
            } else {
                novelTitleLabel.textColor = .black
                novelWriterLabel.textColor = .black
                novelIntroduceLabel.textColor = UIColor(red: 0.56, green: 0.56, blue: 0.56, alpha: 1.0)
            }
            
            [novelTitleLabel, novelWriterLabel, novelIntroduceLabel].forEach {
                elementView.addSubview($0)
            }
                    
            novelTitleLabel.snp.makeConstraints {
                $0.left.equalToSuperview().offset((bounds.height)/26.375)
                $0.top.equalToSuperview().offset((bounds.height)/31.2592592593)
            }
            
            novelWriterLabel.snp.makeConstraints {
                $0.right.equalToSuperview().inset((bounds.height)/25.5757575758)
                $0.top.equalToSuperview().offset((bounds.height)/27.2258064516)
            }
            
            novelIntroduceLabel.snp.makeConstraints {
                $0.left.equalToSuperview().offset((bounds.height)/26.375)
                $0.bottom.equalToSuperview().inset((bounds.height)/32.4615384615)
            }
            
            if axis == "horizontal" {
                let elementWidthConstraint = elementView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor, constant: -11)
                            elementWidthConstraint.isActive = true
            } else {
                elementView.heightAnchor.constraint(equalToConstant: 119).isActive = true
            }
            
            elementView.layer.cornerRadius = 10
            elementView.clipsToBounds = true
            
            stackView.addArrangedSubview(elementView)
            
            if index < colorArray.count - 1 {
                let spacingView = UIView()
                spacingView.translatesAutoresizingMaskIntoConstraints = false
                spacingView.widthAnchor.constraint(equalToConstant: 21).isActive = true
                stackView.addArrangedSubview(spacingView)
            }
        }
    }


    @objc private func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        if index == 0 {
            Novel.isHidden = false
            Essay.isHidden = true
        } else {
            Novel.isHidden = true
            Essay.isHidden = false
        }
    }

    @objc private func didChangeValue(segment: UISegmentedControl) {
    self.shouldHideFirstView = segment.selectedSegmentIndex != 0
    }
}
