//
//  DummyCell.swift
//  TestProj2
//
//  Created by 이숭인 on 2022/01/25.
//

import UIKit

class DummyCell: UICollectionViewCell {
    static let identifier = "dummyCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.backgroundColor = .lightGray
        
//        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        layout()
    }
}
