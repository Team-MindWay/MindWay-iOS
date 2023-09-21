//
//  BookListManager.swift
//  MINDWAY
//
//  Created by 새미 on 2023/07/14.
//

import UIKit

class BookListManager {
    
    private var bookArray: [Book] = []
    
    func makeBookListData() {
        bookArray = [
            Book(bookTitle: "세상의 마지막 기차역", bookWriter: "무라세 다케시"),
            Book(bookTitle: "여름은 오래 그곳에 남아", bookWriter: "마쓰이에 마다시"),
            Book(bookTitle: "세이노의 가르침", bookWriter: "세이노"),
            Book(bookTitle: "럭키 드로우", bookWriter: "드로우앤드류"),
            Book(bookTitle: "멘토의 한마디", bookWriter: "김달국"),
            Book(bookTitle: "원씽 THE ONE THING", bookWriter: "게리켈러, 제이 파파산"),
            Book(bookTitle: "아버지의 해방일지", bookWriter: "정지아")
        ]
    }
    
    func getBookList() -> [Book] {
        return bookArray
    }
    
}
