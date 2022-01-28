//
//  CHMessage.swift
//  GIFinTextViewPrx
//
//  Created by 이숭인 on 2022/01/27.
//

import UIKit

//MARK: - CHMessage
struct CHMessage: Codable {
    var data: [CHDataClass]
}

//MARK: - CHDataClass
struct CHDataClass: Codable {
    let body_text: String
    let body_blockskit: String
    var computedBlocksKit: BodyBlocksKit? = nil// body_blocksKit 을 객체로 변환하여 저장할 프로퍼티
    var reaction: CHChatReaction? // 리액션 목록
}

// MARK: - BodyBlocksKit
struct BodyBlocksKit: Codable {
    let type: String
    let elements: [ChChatListElement]
    
    // MARK: - ChChatListElement
    struct ChChatListElement: Codable {
        let type: String
        let elements: [ElementElementClass]
    }
    
    // MARK: - ElementElementClass
    struct ElementElementClass: Codable {
        let type: String
        let userID, content, name: String?

        enum CodingKeys: String, CodingKey {
            case type
            case userID = "user_id"
            case content, name
        }
    }
}

// MARK: - Reaction
struct CHChatReaction: Codable {
    let count: Int
    let users: [String]
    let value: String
}
