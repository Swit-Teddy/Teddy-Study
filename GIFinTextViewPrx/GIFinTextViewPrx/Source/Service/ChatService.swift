//
//  ChatService.swift
//  GIFinTextViewPrx
//
//  Created by 이숭인 on 2022/01/27.
//

import UIKit
import Then

class ChatService {
    static let shared = ChatService()
    
    private init(){ }
    
    let dateformatter = DateFormatter().then{
        $0.locale = Locale(identifier: Locale.preferredLanguages[0])
        $0.calendar = Calendar(identifier: .iso8601)
        $0.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    }
    
    //MARK: - Chanel 채팅 리스트 데이터 Request
    func requestCHChatData(completion: @escaping (ChatList?)->(Void)){
        let decoder = JSONDecoder()
        
        decoder.dateDecodingStrategy = .custom{ (decoder) -> Date in
            let container = try decoder.singleValueContainer()
            let dateStr = try container.decode(String.self)

            guard let date = self.dateformatter.date(from: dateStr) else{
                return Date()
            }
            return date
        }
        
        guard let data = Bundle.main.url(forResource: "news_channel", withExtension: "json") else { return }
        
        do{
            let jsonData = try Data(contentsOf: data)
            let chatRepo = try decoder.decode(ChatList.self, from: jsonData)
            
            completion(chatRepo)
        }catch{
            print("parsing error")
            completion(nil)

        }
    }
}
