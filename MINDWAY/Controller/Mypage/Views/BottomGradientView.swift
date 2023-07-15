//
//  BottomGradientView.swift
//  MINDWAY
//
//  Created by 신아인 on 2023/07/15.
//

import UIKit
import SnapKit
import Then

class BottomGradientView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private let gradientLayer = CAGradientLayer()
    
    private func setupView() {
        backgroundColor = .clear
        
        let colors: [CGColor] = [
            UIColor.white.cgColor,
            UIColor.lightGray.cgColor
        ]
        
        gradientLayer.colors = colors
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
}

