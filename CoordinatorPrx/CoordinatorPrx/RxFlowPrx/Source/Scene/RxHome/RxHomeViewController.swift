//
//  RxHomeViewController.swift
//  CoordinatorPrx
//
//  Created by 이숭인 on 2022/01/24.
//

import UIKit
import RxFlow
import RxCocoa
import SnapKit
import Then

class RxHomeViewController: UIViewController, Stepper {
    var steps = PublishRelay<Step>()
    
    lazy var button = UIButton().then{
        $0.setTitle("로그아웃", for: .normal)
        $0.backgroundColor = .systemRed
        $0.addTarget(self, action: #selector(logoutButtonDidTap), for: .touchUpInside)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @objc
    func logoutButtonDidTap(){
        
    }
}
