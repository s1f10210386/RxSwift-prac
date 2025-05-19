//
//  extensionPractice.swift
//  RxSwiftPrac
//
//  Created by 金澤帆高 on 2025/05/14.
//

import Foundation

protocol Item {
    var name: String { get }
    var category: String { get }
}

extension Item {
    var description: String {
        return "商品名:\(name),カテゴリ\(category)"
    }
}

struct Book: Item {
    let name: String
    var category: String {
        return "書籍"
    }
}

func runProtocolPractice() {
    let book = Book(name: "hoge")
    var item: Item = book
    print(book.name)
}
