//
//  HomeViewController.swift
//  TestProj2
//
//  Created by 이숭인 on 2022/01/19.
//

import UIKit
import FlexLayout
import PinLayout
import Then

class HomeViewController: UIViewController {
    //MARK: - Properties
    
    //MARK: - UI Components
    let rootFlexContainer = UIView().then{
        $0.backgroundColor = .lightGray
    }
    
    let dummyGrayView = UIView().then{
        $0.backgroundColor = .gray
    }
    
    let segmentedControl = UISegmentedControl(items: ["Intro", "FlexLayout", "PinLayout"]).then{
        $0.selectedSegmentIndex = 0
    }
    
    let dummyLabel = UILabel().then{
        $0.text = "Flexbox layouting is simple, powerfull and fast.\n\nFlexLayout syntax is concise and chainable."
        $0.numberOfLines = 0
    }
    
    let bottomLabel = UILabel().then{
        $0.text = "FlexLayout/yoga is incredibly fast, its even faster than manual layout."
        $0.numberOfLines = 0
    }
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        print("called view did load")
//        setUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setUI()
        print("called viewDidLayoutSubviews")
    }
    
    //MARK: - Functions
    func setUI(){
        self.view.addSubview(rootFlexContainer)
        
        // flex container 내부 자식 레이아웃 설정
        
        rootFlexContainer.flex.direction(.column).padding(10).define { flex in
            flex.addItem().direction(.row).define { flex in
                flex.addItem(self.dummyGrayView).width(100.0).height(100.0)
                
                flex.addItem().direction(.column).paddingLeft(12.0).grow(1).shrink(1).define { flex in
                    flex.addItem(self.segmentedControl)
                    flex.addItem(self.dummyLabel).marginTop(12.0)
                }
            }
            
            flex.addItem().height(1).marginTop(12.0).backgroundColor(.brown)
            flex.addItem(self.bottomLabel).marginTop(12.0)
        }
 
        // rootFlexContainer 의 frame 설정??
        rootFlexContainer.pin.top().horizontally().margin(self.view.pin.safeArea)
        
        // layout() --> 자식뷰 flex container 안에 딱 맞게 배치됨 / default: fitContainer, option: adjustWidth, adjustHeight
        rootFlexContainer.flex.layout(mode: .adjustHeight)
    }
}

/*
 TODO List
 
 1. 일단 원래 하던대로 뷰 생성하고, 제약조건만 flex, pin으로 잡아보자
 2. 다양하게 만들어보면 되지 않을까
 
 */
