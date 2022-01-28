//
//  ChatMessage.swift
//  GIFinTextViewPrx
//
//  Created by 이숭인 on 2022/01/27.
//

import UIKit

struct DMMessage: Codable {
    let data: DataClass
}

struct DataClass: Codable{
    let contents: [Content]
}

struct Content: Codable{
    let body_text: String
}
