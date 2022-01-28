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

class MessageCell: UITableViewCell {
    //MARK: - Properties
    
    
    static let identifier = "messageCell"
    let exampleEmoji: [String: EmojiSource] = [
        "switaction": .imageUrl("https://github.com/GetStream/Streamoji/blob/main/meta/emojis/let_me_in.gif?raw=true"),
        "swit":.imageAsset("jeremy")
    ]

    //MARK: - UI Components
    var textView = UITextView().then {
        $0.isEditable = false
        $0.isScrollEnabled = false
        $0.font = .systemFont(ofSize: 20)
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
    func configure(bodyText: String){
        
//        String(unicodeScalarLiteral: "\u{d83c}\u{ddf2}\u{d83c}\u{ddf3}")
//        self.textView.attributedText = NSAttributedString(string: self.dummyEmoji["key"] ?? "")
//        self.textView.attributedText = NSAttributedString(string: bodyText)
        textView.flex.markDirty()
    }
    
    func layout(){
        textView.configureEmojis(exampleEmoji)
        self.contentView.flex.layout(mode: .adjustHeight)
    }
    
    func setUI(){
        self.contentView.flex.padding(16.0).define { flex in
            flex.addItem(textView).grow(1)
        }
    }
}
