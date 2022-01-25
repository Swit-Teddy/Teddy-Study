//
//  RxFlowLoginViewController.swift
//  CoordinatorPrx
//
//  Created by 이숭인 on 2022/01/24.
//

import UIKit
import RxFlow
import RxCocoa
import SnapKit
import Then

class RxFlowLoginViewController: UIViewController, Stepper {
    var steps = PublishRelay<Step>()
    
    lazy var button = UIButton().then{
        $0.setTitle("로그인", for: .normal)
        $0.backgroundColor = .systemBlue
        $0.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Login"
        self.view.backgroundColor = .systemBackground
        
        setUI()
    }
    
    //MARK: - Functions
    
    func setUI(){
        self.view.addSubview(self.button)
        
        button.snp.makeConstraints{
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(16.0)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-16.0)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-16.0)
        }
        
    }
    
    @objc
    func loginButtonDidTap(){
        self.steps.accept(DemoStep.homeIsRequired)
    }
}
