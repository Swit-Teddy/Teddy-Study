//
//  ExampleViewController.swift
//  TestProj2
//
//  Created by 이숭인 on 2022/01/20.
//

import UIKit
import FlexLayout
import PinLayout
import Then

class ExampleViewController: UIViewController {
    //MARK: - UI Components
    let rootFlexContainerView = UIView().then{
        $0.backgroundColor = .black
    }
    let dummyView = UIView().then{
        $0.backgroundColor = .secondaryLabel
    }
    let dummyView2 = UIView().then{
        $0.backgroundColor = .secondaryLabel
    }
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setUI()
        setLayout()
    }
    
    //MARK: - Functions
    func setUI(){
        self.view.addSubview(rootFlexContainerView)
        
        //direction's default -> column
        rootFlexContainerView.flex.direction(.column).justifyContent(.center).padding(8.0).define { flex in
            flex.addItem(self.dummyView).height(40.0)
            flex.addItem(self.dummyView2).height(40.0).marginTop(12.0)
        }
    }
    
    func setLayout(){
        rootFlexContainerView.pin.all(self.view.pin.safeArea)
        rootFlexContainerView.flex.layout()
    }
}
