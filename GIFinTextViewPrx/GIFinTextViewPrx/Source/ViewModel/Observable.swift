//
//  Observable.swift
//  GIFinTextViewPrx
//
//  Created by 이숭인 on 2022/01/27.
//

import UIKit

class Observable<T> {
    var listener: ((T) -> Void)?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    func bind(listener: ((T) -> Void)?) {
        self.listener = listener
    }
    
    init(value: T){
        self.value = value
    }
}
