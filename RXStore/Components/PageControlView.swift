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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupBackgroundView()
    }
    
    private func setupBackgroundView() {
        backgroundView = UIView(frame: bounds)
        backgroundView.backgroundColor = .clear
        backgroundView.layer.cornerRadius = 5
        backgroundView.layer.masksToBounds = true
        self.addSubview(backgroundView)
        self.sendSubviewToBack(backgroundView)
    }

}
