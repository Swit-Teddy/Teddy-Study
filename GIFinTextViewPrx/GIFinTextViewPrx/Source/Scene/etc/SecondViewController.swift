//
//  SecondViewController.swift
//  GIFinTextViewPrx
//
//  Created by 이숭인 on 2022/01/26.
//

import UIKit
import SwiftGifOrigin
import SnapKit
import Then
import ImageIO

class SecondViewController: UIViewController {
    let textView = UITextView().then{
        $0.backgroundColor = .lightGray
    }
    
    let bottomImageView = UIImageView().then{
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setUI()
        setNavigationItem()
        
        //create your UIImage
        let image = UIImage.gif(name: "jeremy")
        let image2 = UIImage.gif(name: "jeremy")
        //create and NSTextAttachment and add your image to it.
        let attachment = NSTextAttachment()
        let attachment2 = NSTextAttachment()
        attachment.image = image
        attachment2.image = image2
        //put your NSTextAttachment into and attributedString
        let attString = NSAttributedString(attachment: attachment)
        let attString2 = NSAttributedString(attachment: attachment2)
        //add this attributed string to the current position.
        textView.textStorage.insert(attString, at: textView.selectedRange.location)
        textView.textStorage.insert(attString2, at: textView.selectedRange.location)
//        bottomImageView.image = image
        
    }
    
    func setUI(){
        self.view.addSubview(textView)
        self.view.addSubview(bottomImageView)
        
        
//        bottomImageView.snp.makeConstraints{
//            $0.center.equalToSuperview()
//            $0.width.height.equalTo(500.0)
//        }
        textView.snp.makeConstraints{
            $0.center.equalToSuperview()
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(300.0)
        }
//
//        bottomImageView.snp.makeConstraints{
//            $0.top.equalTo(textView).offset(16.0)
//            $0.centerX.equalToSuperview()
//            $0.width.height.equalTo(300.0)
//        }
    }
    
    func setNavigationItem(){
        // navigation tint, shadow 설정
//        self.navigationController?.delegate = self
        self.navigationController?.navigationBar.barTintColor = UIColor.lightGray
        self.navigationController?.navigationBar.isTranslucent = false
        //            self.navigationController?.navigationBar.shadowImage = colorToImage()
        // navigationbar left, right 버튼 설정
        //            self.navigationItem.leftBarButtonItem = logoBtn
        //            self.navigationItem.rightBarButtonItems = [earlyCardBtn]
        // navigationbar backbutton 설정
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "ic_arrow")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "ic_arrow")
        // Title 설정
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
}
