//
//  PageControlView.swift
//  RXStore
//
//  Created by Мельник Дмитрий on 19.07.2023.
//

import UIKit


final class PageControlView: UIPageControl {
    
    var backgroundView = UIView()
    
    public init(frame: CGRect, label: String, icon: UIImage, cornerRadius: CGFloat) {
        super.init(frame: frame)
        
        setupBackgroundView()
//        self.setTitle(label, for: .normal)
//        self.setImage(icon, for: .normal)
//        self.layer.cornerRadius = cornerRadius
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupBackgroundView()
//        layer.masksToBounds = true
//        layer.cornerRadius = 5
//        backgroundView.frame = bounds
    }
    
    private func setupBackgroundView() {
//        self.contetview
        backgroundView = UIView(frame: bounds)
        backgroundView.backgroundColor = UIColor.blue
        backgroundView.layer.cornerRadius = 5
        backgroundView.layer.masksToBounds = true
        self.addSubview(backgroundView)
        // Make sure the background view is behind the page control
        self.sendSubviewToBack(backgroundView)
    }

}
