//
//  MethodGroupHeaderView.swift
//  TestProj2
//
//  Created by 이숭인 on 2022/01/20.
//

import UIKit

class MethodGroupHeaderView: UITableViewHeaderFooterView {
    //MARK: - Properties
    static let identifier = "MethodGroupHeader"
    static let height: CGFloat = 50.0
    
    //MARK: - UI Components
    private let titleLabel = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.sizeToFit()
        
        addSubview(titleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String){
        titleLabel.text = title
        titleLabel.sizeToFit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.pin.horizontally(pin.safeArea.left + 12.0).vCenter()
    }
}
