//
//  MainViewController.swift
//  CoordinatorPrx
//
//  Created by 이숭인 on 2022/01/24.
//

import UIKit

protocol MainViewControllerDelegate{
    func logout() // controller -> main coordinaotor로 이벤트 전달
}

class MainViewController: UIViewController {

    var delegate: MainViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item = UIBarButtonItem(title: "로그아웃",
                                   style: .plain,
                                   target: self,
                                   action: #selector(self.logoutButtonDidTap))
        self.navigationItem.rightBarButtonItem = item
    }
    
    deinit{
        print("- \(type(of: self)) deinit")
    }
    
    @objc
    func logoutButtonDidTap(){
        self.delegate?.logout()
    }
    
}
