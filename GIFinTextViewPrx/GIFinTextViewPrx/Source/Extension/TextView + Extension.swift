//
//  TextView + Extension.swift
//  GIFinTextViewPrx
//
//  Created by 이숭인 on 2022/02/04.
//

import UIKit
import Gifu
import Lottie

extension UITextView{
    public func setAnimationEmoji() {
        self.subviews.forEach{
            if $0 is AnimationView || $0 is GIFImageView {
                $0.removeFromSuperview()
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.convertAnimationEmoji()
        }
    }
    
    private func convertAnimationEmoji(){
        let length = self.attributedText.length
        self.attributedText.enumerateAttribute(.attachment, in: NSRange(location: 0, length: length), options: [], using: { value, range, stop in
                if value is MyTextAttachment {
                    let attachment = value as? MyTextAttachment
                    
                    self.selectedRange = range
                    var rect = CGRect()
                    if let selectedTextRange = self.selectedTextRange {
                        rect = self.firstRect(for: selectedTextRange)
                    }else{
                        return
                    }
                    
                    if attachment?.attachType == .lottie {
                        let av = AnimationView(name: (attachment?.imageName) ?? "")
                        av.play()
                        av.loopMode = .loop
                        av.backgroundBehavior = .pauseAndRestore
                        av.contentMode = .scaleAspectFill
                        av.frame = rect
                        
                        self.addSubview(av)
                    }else if attachment?.attachType == .gif{
                        let iv = GIFImageView(frame: rect)
                        self.addSubview(iv)
                        iv.animate(withGIFNamed: (attachment?.imageName) ?? "")
                    }
                }
        })
        self.selectedRange = NSRange(location: length + 1, length: length + 1)
    }
}
