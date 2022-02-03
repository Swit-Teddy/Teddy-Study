//
//  MessageCell.swift
//  GIFinTextViewPrx
//
//  Created by 이숭인 on 2022/01/27.
//

import UIKit
import Then
import FlexLayout
import PinLayout
import Streamoji

/*
 MessageCell 에서 표현할 데이터 목록
 1. 맨션 - in bodyBlocksKit / textView
 2. 본문 - in bodyBlocksKit / textView
 3. 이모지 - in bodyBlocksKit / textView
 4. 리액션 - in bodyBlocksKit / textView 밑에
 5. 코맨트(나중에)
 */

class MessageCell: UITableViewCell {
    //MARK: - Properties
    static let identifier = "messageCell"
    let exampleEmoji: [String: EmojiSource] = [
        "switaction": .imageUrl("https://github.com/GetStream/Streamoji/blob/main/meta/emojis/let_me_in.gif?raw=true"),
        "swit":.imageAsset("jeremy"),
        "switactiongreen": .character("😃"),
        "blush": .imageUrl("https://github.com/GetStream/Streamoji/blob/main/meta/emojis/let_me_in.gif?raw=true"),
        "bowing": .imageUrl("https://github.com/GetStream/Streamoji/blob/main/meta/emojis/let_me_in.gif?raw=true"),
        
    ]
    
    //MARK: - UI Components
    var textView = UITextView().then {
        $0.isEditable = false
        $0.isScrollEnabled = false
    }
    
    //MARK: - Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .lightGray
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        /*
         1. 원래 뷰 크기 받아온 후 -> contentView 의 width 사이즈를 원래 뷰의 사이즈에 맞춘다.
         2. layout() 을 호출함으로써 서브뷰의 크기를 변경시키고, 뷰 사이즈의 변경이 일어남에 따라 layoutSubviews 가 호출된다.
         */
        self.contentView.pin.width(size.width)
        layout()
        
        return self.contentView.frame.size
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    //MARK: - Functions
    func configure(chChatData: Chat){
        let atrStr = NSMutableAttributedString(string: "")
        var bodyText = NSAttributedString(string: "")
        let decoder = JSONDecoder()
        let data = Data(chChatData.bodyBlockskit.utf8)
        
        bodyText = NSAttributedString(string: chChatData.bodyText)
        
        guard let result = try? decoder.decode(BodyBlocksKit.self, from: data) else { return }
        guard let elements = result.elements else { return }
        guard let element = elements.first else { return }
        
        element.elements!.forEach{ textElement in
            if let item = textElement.applyText() {
                atrStr.append(item)
            }
        }
        
        let textContent = NSMutableAttributedString(string: "").then{
            let content = atrStr.string.count > 0 ? atrStr : bodyText
            $0.append(content)
            $0.addAttribute(.font,
                            value: UIFont.systemFont(ofSize: 16.0),
                            range: (content.string as NSString).range(of: content.string))
        }
        
        self.textView.attributedText = textContent
        
        textView.flex.markDirty()
    }
    
    func layout(){
        textView.configureEmojis(exampleEmoji)
        self.contentView.flex.layout(mode: .adjustHeight)
    }
    
    func setUI(){
        self.contentView.flex.padding(8.0).define { flex in
            flex.addItem(textView)
        }
    }
}
