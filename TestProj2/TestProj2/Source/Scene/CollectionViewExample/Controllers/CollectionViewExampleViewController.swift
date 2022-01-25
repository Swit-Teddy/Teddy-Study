//
//  CollectionViewExampleViewController.swift
//  TestProj2
//
//  Created by 이숭인 on 2022/01/25.
//

import UIKit
import Kingfisher
import FlexLayout
import PinLayout
import Then

struct House {
    let name: String
    let price: String
    let distance: Int
    let mainImageURL: URL
}

class CollectionViewExampleViewController: UIViewController {
    //MARK: - Properties
    var houses: [House] = [
        House(name: "Castlecrag House",
              price: "1,500,000$",
              distance: 12,
              mainImageURL: URL(string: "https://i.pinimg.com/736x/76/cc/b4/76ccb45bc61b098c7b9b75de62fcf533--house-design-campo-grande.jpg")!),
        House(name: "Port Ludlow House",
              price: "1,240,000$",
              distance: 15,
              mainImageURL: URL(string: "https://st.hzcdn.com/simgs/f271957f001074d1_4-3434/modern-exterior.jpg")!),
        House(name: "Modern Facade boxes House",
              price: "950,000$",
              distance: 22,
              mainImageURL: URL(string: "https://i.pinimg.com/originals/10/b2/cd/10b2cdbf28cef49281463998dda20796.jpg")!),
        House(name: "Contemporary Modern Home",
              price: "1,456,000$",
              distance: 32,
              mainImageURL: URL(string: "https://i.pinimg.com/736x/5e/8f/0b/5e8f0b24f19624754d2aa37968217d5d--architecture-house-design-modern-house-design.jpg")!),
        House(name: "Angel House",
              price: "932,000$",
              distance: 82,
              mainImageURL: URL(string: "https://i.pinimg.com/736x/6d/6c/ab/6d6cab9db70117727e3eb2adf0dbc080--small-modern-house-plans-modern-houses.jpg")!)
    ]
    fileprivate let cellTemplate = HouseCell()
    
    //MARK: - UI Components
    fileprivate lazy var flowLayout = UICollectionViewFlowLayout().then{
        $0.scrollDirection = .vertical
        $0.minimumLineSpacing = 8
        $0.minimumInteritemSpacing = 10
    }
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout).then{
        $0.backgroundColor = .white
        $0.delegate = self
        $0.dataSource = self
        $0.register(HouseCell.self, forCellWithReuseIdentifier: HouseCell.reuseIdentifier)
    }
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.collectionView.pin.all(self.view.safeAreaInsets)
        self.collectionView.flex.layout(mode: .adjustHeight)
    }
    
    //MARK: - Functions
    func setUI(){
        self.view.addSubview(self.collectionView)
    }
}

//MARK: - UICollectionViewDelegate extension
extension CollectionViewExampleViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //TODO: ~~
    }
}


//MARK: - UICollectionViewDataSource extension
extension CollectionViewExampleViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.houses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HouseCell.reuseIdentifier, for: indexPath) as? HouseCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(house: self.houses[indexPath.row])
        
        return cell
    }
}

extension CollectionViewExampleViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        self.cellTemplate.configure(house: houses[indexPath.row])
        
        print("height --> \(CGFloat.greatestFiniteMagnitude)")
        
        return cellTemplate.sizeThatFits(CGSize(width: collectionView.bounds.width, height: .greatestFiniteMagnitude))
    }
    
}

