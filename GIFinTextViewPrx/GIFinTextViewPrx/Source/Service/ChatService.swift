//
//  ChatService.swift
//  GIFinTextViewPrx
//
//  Created by 이숭인 on 2022/01/27.
//

import UIKit

class ChatService {
    static let shared = ChatService()
    
    private init(){ }
    
    //MARK: - DM 채팅 리스트 데이터 Request
    func requestDMChatData(completion: @escaping (DMMessage?)->(Void)){
        guard let fileLocation = Bundle.main.url(forResource: "dm_chat_list", withExtension: "json") else {
            print("nlialaal")
            completion(nil)
            return
        }
        
        do {
            // 4. 해당 위치의 파일을 Data로 초기화하기
            let data = try Data(contentsOf: fileLocation)
            let json = try JSONDecoder().decode(DMMessage.self, from: data)
            
            completion(json)
        } catch {
            // 5. 잘못된 위치나 불가능한 파일 처리 (오늘은 따로 안하기)
            print("nlialaal")
            completion(nil)
        }
    }
    
    //MARK: - Chanel 채팅 리스트 데이터 Request
    func requestCHChatData(completion: @escaping (CHMessage?)->(Void)){
        guard let fileLocation = Bundle.main.url(forResource: "ch_chat_list", withExtension: "json") else {
            print("nlialaal")
            completion(nil)
            return
        }
        
        do {
            // 4. 해당 위치의 파일을 Data로 초기화하기
            let data = try Data(contentsOf: fileLocation)
            let json = try JSONDecoder().decode(CHMessage.self, from: data)
            
            completion(json)
        } catch {
            print("parsing error")
            completion(nil)
        }
    }
}
