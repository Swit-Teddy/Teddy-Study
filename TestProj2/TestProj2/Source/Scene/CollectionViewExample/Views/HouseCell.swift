//
//  HouseCell.swift
//  TestProj2
//
//  Created by 이숭인 on 2022/01/25.
//

import UIKit
import Kingfisher
import FlexLayout
import PinLayout
import Then

class HouseCell: UICollectionViewCell {
    //MARK: - Properties
    static let reuseIdentifier: String = "houseCell"
    
    //MARK: - UI Components
    private lazy var nameLabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 24)
        $0.textColor = .black
    }
    
    private lazy var mainImage = UIImageView().then{
        $0.backgroundColor = .black
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    private let priceLabel = UILabel()
    
    private lazy var distanceLabel = UILabel().then{
        $0.textAlignment = .right
    }
    
    //MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.backgroundColor = .white
        
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
        self.contentView.pin.width(size.width) // 뷰 사이즈 변경
        layout() // 변경사항 적용
        
        print("contentview frame size --> \(contentView.frame.size)")
        return self.contentView.frame.size
    }
    //MARK: - Functions
    private func layout(){
        self.contentView.flex.layout(mode: .adjustHeight)
    }
    
    func configure(house: House){
        self.nameLabel.text = house.name
        self.nameLabel.flex.markDirty()
        
        self.mainImage.kf.setImage(with: house.mainImageURL)
        self.mainImage.image = UIImage(systemName: "star")
        
        self.priceLabel.text = house.price
        self.priceLabel.flex.markDirty()
        
        self.distanceLabel.text = "\(house.distance) KM"
        self.distanceLabel.flex.markDirty()
        
        setNeedsLayout()
    }
    
    func setUI(){
        contentView.flex.define { (flex) in
            flex.addItem().backgroundColor(.lightGray).paddingHorizontal(10).define({ (flex) in
                flex.addItem(nameLabel).grow(1)
            })

            flex.addItem(mainImage).height(300)

            flex.addItem().direction(.row).justifyContent(.spaceBetween).padding(6, 10, 6, 10).backgroundColor(.lightGray)
                .define({ (flex) in
                    flex.addItem(priceLabel)
                    flex.addItem(distanceLabel).grow(1)
                })
        }

//        self.contentView.flex.define { flex in
//            flex.addItem().define { flex in
//                flex.addItem(self.nameLabel)
//            }
//
//            flex.addItem(self.mainImage).height(300)
//
//            flex.addItem().direction(.row).define { flex in
//                flex.addItem(self.priceLabel)
//                flex.addItem(self.distanceLabel).grow(1)
//            }
//        }
    }
}
