//
//  PopupViewController.swift
//  MINDWAY
//
//  Created by 신아인 on 2023/07/17.
//

import UIKit

class PopupViewController: BaseViewController {
    
    var boxInBookName: String?
    
    var onDelete: ((String) -> Void)? = nil
    
    let popupView = PopupView()
    
    let maxLength = 18
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black.withAlphaComponent(0.3)
        popupView.selectBookLabel.text = boxInBookName
        popupView.selectBookLabel.bookReadMore(maxLength: maxLength)
    }
    
    override func addTarget() {
        popupView.cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        popupView.deleteButton.addTarget(self, action: #selector(sendBookName), for: .touchUpInside)
    }
    
    override func addView() {
        view.addSubview(popupView)
    }
    
    override func setLayout() {
        popupView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    @objc func cancel() {
        self.dismiss(animated: true)
    }
    
    @objc func sendBookName(at index: Int) {
        if let bookName = boxInBookName {
            onDelete?(bookName)
        }
        self.dismiss(animated: true)
    }
}
