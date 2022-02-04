//
//  ChatExtension.swift
//  GIFinTextViewPrx
//
//  Created by 이숭인 on 2022/02/03.
//

import UIKit

extension Chat{
    func getChatContent(size: CGFloat) -> NSMutableAttributedString{
        let textContent = NSMutableAttributedString(string: "").then{
            let content = self.convertStringToBodyBlocksKit()
            $0.append(content)
            $0.addAttribute(.font,
                            value: UIFont.systemFont(ofSize: size),
                            range: (content.string as NSString).range(of: content.string))
        }
        
        return textContent
    }
    
    //TODO: - string 형태의 bodyBlocksKit을 -> BodyBlocksKit 형태로 Convert 
    private func convertStringToBodyBlocksKit() -> NSAttributedString{
        let atrStr = NSMutableAttributedString(string: "")
        var bodyText = NSAttributedString(string: "")
        let decoder = JSONDecoder()
        let data = Data(self.bodyBlockskit.utf8)
        
        bodyText = NSAttributedString(string: self.bodyText)
        
        guard let result = try? decoder.decode(BodyBlocksKit.self, from: data) else { return bodyText }
        guard let elements = result.elements else { return bodyText }
        guard let element = elements.first else { return bodyText}
        
        element.elements!.forEach{ textElement in
            if let item = textElement.applyText() {
                atrStr.append(item)
            }
        }
        
        return atrStr.string.count > 0 ? atrStr : bodyText
    }
}
