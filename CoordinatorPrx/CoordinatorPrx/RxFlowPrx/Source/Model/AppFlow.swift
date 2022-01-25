//
//  AppFlow.swift
//  CoordinatorPrx
//
//  Created by 이숭인 on 2022/01/24.
//

import UIKit
import RxFlow

class AppFlow: Flow {
    var window: UIWindow
    
    var root: Presentable {
        return self.window
    }
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? DemoStep else { return .none }
        switch step {
        case .loginIsRequired:break
//            return self.navigateToLogin()
        case .homeIsRequired: break
//            return self.navigateToHome()
        }
    }
}
