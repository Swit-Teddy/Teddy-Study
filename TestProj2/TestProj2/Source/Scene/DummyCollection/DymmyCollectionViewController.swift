//
//  DymmyCollectionViewController.swift
//  TestProj2
//
//  Created by 이숭인 on 2022/01/25.
//

import UIKit
import Kingfisher
import FlexLayout
import PinLayout
import Then
import SnapKit

class DymmyCollectionViewController: UIViewController {

    lazy var layout = UICollectionViewFlowLayout().then{
        $0.scrollDirection = .vertical
        $0.minimumLineSpacing = 8
        $0.minimumInteritemSpacing = 10
    }
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then{
        $0.dataSource = self
        $0.delegate = self
        $0.register(DummyCell.self, forCellWithReuseIdentifier: DummyCell.identifier)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        setUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.collectionView.pin.all(self.view.pin.safeArea)
        self.collectionView.flex.layout(mode: .adjustHeight)
    }
    
    func setUI(){
        self.view.addSubview(collectionView)
        
//        collectionView.snp.makeConstraints{
//            $0.top.bottom.equalTo(self.view.safeAreaLayoutGuide)
//            $0.leading.trailing.equalToSuperview()
//        }
    }

}


extension DymmyCollectionViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DummyCell.identifier, for: indexPath) as? DummyCell else {
            return UICollectionViewCell()
        }
        
        print("adsassadasdadasd")
        
        return cell
    }
    
    
}

extension DymmyCollectionViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: 300.0)
    }
    
}
