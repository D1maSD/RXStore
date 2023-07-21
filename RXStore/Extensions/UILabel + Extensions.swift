//
//  UILabel + Extensions.swift
//  RXStore
//
//  Created by Мельник Дмитрий on 19.07.2023.
//

import UIKit
import SnapKit

extension UILabel {
    
    convenience init(text: String) {
        self.init()
        self.text = text
    }
    
    convenience init(text: String, color: UIColor) {
        self.init()
        self.textColor = color
        self.text = text
    }
    
    func edgeTo(view: UIView) {
        
        translatesAutoresizingMaskIntoConstraints = false
        self.snp.makeConstraints {
            $0.top.equalTo(view.snp.top)
            $0.leading.equalTo(view.snp.leading)
            $0.trailing.equalTo(view.snp.trailing)
            $0.bottom.equalTo(view.snp.bottom)
        }
    }
}
