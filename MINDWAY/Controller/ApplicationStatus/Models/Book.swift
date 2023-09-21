//
//  Book.swift
//  MINDWAY
//
//  Created by 새미 on 2023/07/14.
//

import UIKit

struct Book {
    
    static var bookNumber: Int = 1
    
    let bookId: Int
    var bookTitle: String?
    var bookWriter: String?
//    let link: URL
    
    init(bookTitle: String?, bookWriter: String?) {
        self.bookId = Book.bookNumber
        
        self.bookTitle = bookTitle
        self.bookWriter = bookWriter
        
        Book.bookNumber += 1
    }
}
