//
//  BaseViewController.swift
//  MINDWAY
//
//  Created by 신아인 on 2023/06/30.
//

import UIKit
import Then
import SnapKit

class BaseViewController: UIViewController {
    let bounds = UIScreen.main.bounds
    
    lazy var topLogoImage = UIImageView().then {
        $0.image = UIImage(named: "miniLogo")
   }
    
    //@available(*, unavailable)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addView()
        setLayout()
        addTarget()
        configNavigation()
    }
    
    func addView(){}
    func setLayout(){}
    func addTarget(){}
    func configNavigation(){}
}
