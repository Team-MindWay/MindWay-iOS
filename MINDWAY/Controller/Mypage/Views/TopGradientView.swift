//
//  TopGradientView.swift
//  MINDWAY
//
//  Created by 신아인 on 2023/07/13.
//

import UIKit
import SnapKit
import Then

class TopGradientView: UIView {
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
            UIColor.lightGray.cgColor,
            UIColor.white.cgColor
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
