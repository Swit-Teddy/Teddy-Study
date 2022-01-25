//
//  MethodCell.swift
//  TestProj2
//
//  Created by 이숭인 on 2022/01/25.
//

import UIKit
import Then
import FlexLayout
import PinLayout

class MethodCell: UITableViewCell {
    //MARK: - Properties
    static let reuseIdentifier = "MethodCell"
    
    //MARK: - UI Components
    private let nameLabel = UILabel().then{
        $0.font = UIFont.boldSystemFont(ofSize: 14)
        $0.lineBreakMode = .byTruncatingTail // 말줄임 ... 설정
    }
    
    private let descriptionLabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.numberOfLines = 0
    }
    
    private let profileImageView = UIImageView()
    
    //MARK: - Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        layout()
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        /*
         1. 원래 뷰 크기 받아온 후 -> contentView 의 width 사이즈를 원래 뷰의 사이즈에 맞춘다.
         2. layout() 을 호출함으로써 서브뷰의 크기를 변경시키고, 뷰 사이즈의 변경이 일어남에 따라 layoutSubviews 가 호출된다.
         */
        self.contentView.pin.width(size.width)
        
        layout()
        
        print("contentview frame size --> \(contentView.frame.size)")
        return self.contentView.frame.size
    }
    
    //MARK: - Functions
    func configure(method: Method){
        self.nameLabel.text = method.name
        self.descriptionLabel.text = method.description
        self.profileImageView.image = UIImage(systemName: "star")
        
        self.nameLabel.flex.markDirty()
        self.descriptionLabel.flex.markDirty()
        
    }
    
    func layout(){
        self.contentView.flex.layout(mode: .adjustHeight)
    }
    
    func setUI(){
        self.contentView.flex.padding(12.0).define { flex in
            flex.addItem().direction(.row).define { flex in
                flex.addItem(self.profileImageView).size(30.0)
                flex.addItem(self.nameLabel).marginLeft(8.0).grow(1)
            }
            
            flex.addItem(self.descriptionLabel).marginTop(16.0)
        }
    }
}
