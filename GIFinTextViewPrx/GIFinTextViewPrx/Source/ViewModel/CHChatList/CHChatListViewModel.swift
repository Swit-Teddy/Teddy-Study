//
//  CHChatListViewModel.swift
//  GIFinTextViewPrx
//
//  Created by 이숭인 on 2022/01/27.
//

import UIKit

class CHChatListViewModel {
    let chatService = ChatService.shared // Chat 데이터 가져오기 위한 통신 싱글턴 객체
    var chChatData: Observable<[CHDataClass]> =  Observable(value: []) // 빈 데이터
    
    //MARK: - chanel의 채팅 데이터 로드
    func loadCHChatData(){
        self.chatService.requestCHChatData { msgs in
            guard let msgs = msgs else { return }
            
            self.chChatData.value.append(contentsOf: msgs.data.filter { $0.body_text != "" })
        }
        // TODO: chChatData의 bodyBlocksKit string -> obj 형변환 [o]
        self.parseBodyBlocksKitToJson()
    }
    
    //MARK: - bodyBlockskit 모델 String to Json
    private func parseBodyBlocksKitToJson(){
        //TODO: 1. self.chChatData의 bodyBlock ...(json 형식을 띄고 있는 문자열) 을  string -> dic형태로 변환 [o]
        //TODO: 2. dic -> json 객체로 변환 [o]
        //TODO: 3. json -> Custom 객체로 다시 변환 [o]
        
        self.chChatData.value.enumerated().forEach { index, message in
           let strData = message.body_blockskit
            var dicData : Dictionary<String, Any> = [String : Any]()
            
            do {
//                 딕셔너리에 데이터 저장 실시
                dicData = try JSONSerialization.jsonObject(with: Data(strData.utf8), options: []) as! [String:Any]
                //TODO: Dic -> json
                let data = try JSONSerialization.data(withJSONObject: dicData, options: .prettyPrinted)
                //TODO: json -> BodyBlocksKit 객체화
                let messages = try JSONDecoder().decode(BodyBlocksKit.self, from: data)
                
                self.chChatData.value[index].computedBlocksKit = messages
            } catch {
                print(error.localizedDescription)
            }
        }//forEach
        
    }
}
