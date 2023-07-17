//
//  MypageViewModel.swift
//  MINDWAY
//
//  Created by 신아인 on 2023/07/15.
//

import Foundation

class MypageViewModel {
    var data: [BookApplyHistory] = []
    
    func fetchData() {
        data = [
            BookApplyHistory(bookName: "세상의 마지막 기차역", author: "무라세 다케시"),
            BookApplyHistory(bookName: "여름은 오래 그곳에 남아", author: "마쓰이에 마사시"),
        ]
    }
}
