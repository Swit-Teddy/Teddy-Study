//
//  CHChatListViewModel.swift
//  GIFinTextViewPrx
//
//  Created by 이숭인 on 2022/01/27.
//

import UIKit

class CHChatListViewModel {
    let chatService = ChatService.shared // Chat 데이터 가져오기 위한 통신 싱글턴 객체
    var chChatData: Observable<[Chat]> =  Observable(value: []) // 빈 데이터
    
    //MARK: - chanel의 채팅 데이터 로드
    func loadCHChatData(){
        self.chatService.requestCHChatData { msgs in
            guard let msgs = msgs else { return }
            
            self.chChatData.value.append(contentsOf: msgs.data)
        }
    }
    
    func convertBodyBlocksKit() -> NSAttributedString{
        let atrStr = NSMutableAttributedString(string: "")
        var bodyText = NSAttributedString(string: "")
        let decoder = JSONDecoder()
        
        self.chChatData.value.forEach{ chat in
            let data = Data(chat.bodyBlockskit.utf8)
            bodyText = NSAttributedString(string: chat.bodyText)
            
            guard let result = try? decoder.decode(BodyBlocksKit.self, from: data) else { return }
            guard let elements = result.elements else { return }
            guard let element = elements.first else { return }
            
            element.elements!.forEach{ textElement in
                if let item = textElement.applyText() {
                    atrStr.append(item)
                }
            }
        }// for
        return atrStr.string.count > 0 ? atrStr : bodyText
    }
}
