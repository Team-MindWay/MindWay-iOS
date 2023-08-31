//
//  LoginViewController.swift
//  MINDWAY
//
//  Created by 김주은 on 2023/08/20.
//

import UIKit
import GAuthSignin

class LoginViewController: BaseViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 197, height: 130))
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        navigationController?.navigationItem.hidesBackButton = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center
        
        DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
            self.animate()
        })
    }
    
    private func animate() {
        UIView.animate(withDuration: 1, animations: {
            self.imageView.frame.origin.y -= 75
        })
    }
    
    private let gauthButton = UIButton().then {
        $0.backgroundColor = .blue
        $0.addTarget(self, action: #selector(gauthButtonTap), for: .touchUpInside)
    }
    
    override func addView() {
        view.addSubview(gauthButton)
    }
    
    override func setLayout() {
        gauthButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset((bounds.height)/7.2136752137)
            $0.width.equalTo(195)
            $0.height.equalTo(36)
            $0.centerX.equalToSuperview()
        }
    }
    
    @objc func gauthButtonTap() {
        let tabBarController = TabBarViewController()
        navigationController?.pushViewController(tabBarController, animated: true)
        
        navigationController?.navigationItem.hidesBackButton = true
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let loginViewController = LoginViewController()
        let navigationController = UINavigationController(rootViewController: loginViewController)
        
        return true
    }
}
