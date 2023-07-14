//
//  BookListManager.swift
//  MINDWAY
//
//  Created by 새미 on 2023/07/14.
//

import Foundation

final class BookListManager {
    
    private var bookList: [Book] = []
    
    func makeBookListData() {
        bookList = [
            Book(booktitle: "세상의 마지막 기차역", writer: "무라세 다케시"),
            Book(booktitle: "여름은 오래 그곳에 남아", writer: "마쓰이에 마다시"),
            Book(booktitle: "세이노의 가르침", writer: "세이노"),
            Book(booktitle: "럭키 드로우", writer: "드로우앤드류"),
            Book(booktitle: "멘토의 한마디", writer: "김달국"),
            Book(booktitle: "원씽 THE ONE THING", writer: "게리켈러, 제이 파파산"),
            Book(booktitle: "아버지의 해방일지", writer: "정지아")
        ]
    }
    
    func getBookList() -> [Book] {
        return bookList
    }
    
    subscript(index: Int) -> Book {
        get {
            return bookList[index]
        }
    }
}
