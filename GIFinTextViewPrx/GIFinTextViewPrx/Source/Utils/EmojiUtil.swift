//
//  EmojiUtil.swift
//  GIFinTextViewPrx
//
//  Created by 이숭인 on 2022/02/03.
//

import UIKit

class EmojiUtil {
    static let shared = EmojiUtil()
    var emojiDictionary:[String:[String:String]] = [:]
    
    private init() {
        makeEmojiDictionary()
    }
    
    private func makeEmojiDictionary(){
        guard let fileURL = Bundle.main.url(forResource: "emoji", withExtension: "json") else { return }
        guard let data = try? Data(contentsOf: fileURL) else { return }
        
        emojiDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String:[String:String]]
    }
    
    func getEmoji(name:String,size:Int) -> NSAttributedString{
        var name = name
        name.removeFirst()
        name.removeLast()

        guard let inner = self.emojiDictionary[name] else {
            let attachment = NSTextAttachment()

            let emoji = NSMutableAttributedString()
            emoji.append(NSAttributedString(attachment: attachment))
            return emoji
        }
        print("name --> \(inner["name"] ?? "")")
        return NSAttributedString(string: inner["name"] ?? "")
    }
}
