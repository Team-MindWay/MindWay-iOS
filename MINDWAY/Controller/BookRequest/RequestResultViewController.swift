//
//  PopupViewController.swift
//  MINDWAY
//
//  Created by 새미 on 2023/07/24.
//

import UIKit

final class RequestResultViewController: BaseViewController {

    // MARK: - Properties
    var bookTitle: String?
    
    let popupView = RequestDetailView()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    // MARK: - Setting
    func setup() {
        addView()
        setLayout()
        
        popupView.bookTitle.text = self.bookTitle
        
        self.view.backgroundColor = .black.withAlphaComponent(0.3)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    // MARK: - Add View
    override func addView() {
        view.addSubview(popupView)
    }

    // MARK: - Layout
    override func setLayout() {
        popupView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
