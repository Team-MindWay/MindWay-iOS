//
//  TopGradationView.swift
//  MINDWAY
//
//  Created by 새미 on 2023/08/15.
//

import UIKit
import SnapKit
import Then

final class TopGradationView: UIView {
    
    private let gradientLayer = CAGradientLayer()

    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        gradientLayer.frame = self.bounds
    }
    
    // MARK: - View Setting
    private func setupView() {
        backgroundColor = .clear
        
        let colors: [CGColor] = [
            UIColor.init(red: 0.92, green: 0.92, blue: 0.92, alpha: 1).cgColor,
            UIColor.white.cgColor
        ]
        
        gradientLayer.colors = colors
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }

}
