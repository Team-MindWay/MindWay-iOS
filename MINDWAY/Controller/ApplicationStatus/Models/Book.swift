//
//  Book.swift
//  MINDWAY
//
//  Created by 새미 on 2023/07/14.
//

import Foundation

struct Book {
    
    static var bookNumber: Int = 1
    
    let bookId: Int?
    var bookTitle: String?
    var writer: String?
    
    init(booktitle: String?, writer: String?) {
        
        self.bookId = Book.bookNumber
        
        self.bookTitle = booktitle
        self.writer = writer
        
        Book.bookNumber += 1
    }
}
