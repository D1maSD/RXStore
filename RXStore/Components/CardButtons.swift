//
//  CardButtons.swift
//  RXStore
//
//  Created by Мельник Дмитрий on 19.07.2023.
//

import UIKit


final class CardButton: UIButton {
    
    public init(frame: CGRect, label: String, icon: UIImage, cornerRadius: CGFloat) {
        super.init(frame: frame)
        self.setTitle(label, for: .normal)
        self.setImage(icon, for: .normal)
        self.layer.cornerRadius = cornerRadius
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.masksToBounds = true
        layer.cornerRadius = 5
    }
}
