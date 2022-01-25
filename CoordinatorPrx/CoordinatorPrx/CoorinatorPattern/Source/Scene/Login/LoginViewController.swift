//
//  LoginViewController.swift
//  CoordinatorPrx
//
//  Created by 이숭인 on 2022/01/24.
//

import UIKit

protocol LoginViewControllerDelegate{
    func login() // VC에서 발생한 이벤트를 delegate를 이용해 coordinator로 전달하기 위함
}

class LoginViewController: UIViewController {
    
    var delegate: LoginViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        let item = UIBarButtonItem(title: "로그인",
                                   style: .plain,
                                   target: self,
                                   action: #selector(self.loginButtonDidTap))
        self.navigationItem.rightBarButtonItem = item
        
    }
    
    deinit{
        print("- \(type(of: self)) deinit")
    }
    
    @objc
    func loginButtonDidTap(){
        self.delegate?.login()
    }

}
