//
//  MyTextAttachment.swift
//  GIFinTextViewPrx
//
//  Created by 이숭인 on 2022/02/04.
//

import UIKit

enum AttachType{
    case image
    case lottie
    case gif
}

class MyTextAttachment:NSTextAttachment{
    var attachType:AttachType
    var imageName:String
     
    init(attachType:AttachType,imageName:String,size:CGFloat){
        self.attachType = attachType
        self.imageName = imageName
        
        super.init(data: Data(), ofType: "gif")
        image = UIImage()
        bounds = CGRect(x: 0, y: 0, width: size, height: size)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
