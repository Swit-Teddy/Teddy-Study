//
//  TabBarViewController.swift
//  GIFinTextViewPrx
//
//  Created by 이숭인 on 2022/01/26.
//

import UIKit
import SnapKit
import Then

class TabBarViewController: UITabBarController {
    lazy var earlybirdVC = ViewController().then{
        $0.tabBarItem = UITabBarItem(title: "채팅",
                                     image: UIImage(systemName: "star"),
                                     selectedImage: UIImage(systemName: "star")?.withRenderingMode(.alwaysOriginal))
        $0.navigationItem.largeTitleDisplayMode = .always
    }
    let exhibitVC = StremojiTestViewController().then{
        $0.tabBarItem = UITabBarItem(title: "Stremo",
                                     image: UIImage(systemName: "star"),
                                     selectedImage: UIImage(systemName: "star")?.withRenderingMode(.alwaysOriginal))
        $0.navigationItem.largeTitleDisplayMode = .always
    }
    let gifuTestVC = GifuTestViewController().then{
        $0.tabBarItem = UITabBarItem(title: "gifu",
                                     image: UIImage(systemName: "star"),
                                     selectedImage: UIImage(systemName: "star")?.withRenderingMode(.alwaysOriginal))
        $0.navigationItem.largeTitleDisplayMode = .always
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabbarUI()
        setTabBarLink()
    }
    
    private func setTabbarUI(){
                tabBar.tintColor = UIColor.lightGray
        tabBar.barTintColor = UIColor.lightGray
        //        tabBar.unselectedItemTintColor = UIColor.Basic.gray04
//        tabBar.isTranslucent = false
        //        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        //        tabBar.layer.borderWidth = 1.0
        //        tabBar.layer.cornerRadius = 20.0
        //        tabBar.layer.borderColor = UIColor.Basic.gray03.cgColor
        //        // tabbar shadow 지우기
        //        UITabBar.appearance().shadowImage = UIImage()
        //        UITabBar.appearance().backgroundImage = UIImage()
        //        //        UITabBar.appearance().backgroundColor = UIColor.white
    }
    
    private func setTabBarLink() {
        let earlybiard = UINavigationController(rootViewController: earlybirdVC)
        let exhibit = UINavigationController(rootViewController: exhibitVC)
        let gifuTest = UINavigationController(rootViewController: gifuTestVC)
        
        viewControllers = [
            earlybiard,
            exhibit,
            gifuTest
        ]
        
    }
    
}
