//
//  DummyMessage.swift
//  GIFinTextViewPrx
//
//  Created by 이숭인 on 2022/01/29.
//

import UIKit

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//


import Foundation
import UIKit
//import RichString

struct BodyBlocksKit : Codable{
    var type : String?
    var elements : [Elements]?
}

struct Elements : Codable{
    var type : String?
    var elements : [TextElements]?
}

struct TextElements : Codable{
    var type : RichType?
    var content : String?
    var styles : Styles?
    var url : String?
    var indent : Int?
    var elements : [TextElements]?
    var userID : String?
    var name : String?
    
    enum CodingKeys: String, CodingKey {
        case type
        case userID = "user_id"
        case content, name, url, styles
        case indent
    }
}

struct Styles : Codable {
    var bold : Bool?
    var italic : Bool?
    var strike : Bool?
    var code : Bool?
}

enum RichType: String, Codable {
    case text = "rt_text"
    case mention = "rt_mention"
    case link = "rt_link"
    case emoji = "rt_emoji"
    case section = "rt_section"
}

extension TextElements{
    func applyText() -> NSAttributedString?{
        switch(self.type){
        case .text:
            return NSAttributedString(string: self.content ?? "")
        case .link:
            return NSAttributedString(string: self.content ?? "")
        case .emoji:
            return EmojiUtil.shared.getEmoji(name: self.name ?? "", size: 16)
        case .mention:
            return NSAttributedString(string: "@" + (self.userID ?? "" ))
        default:
            print("exception error")
            return nil
        }
    }
}
