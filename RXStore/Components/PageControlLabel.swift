//
//  PageControlLabel.swift
//  RXStore
//
//  Created by Мельник Дмитрий on 19.07.2023.
//

import UIKit
import SnapKit


final class PageControlLabel: UIView {
    
   
    private let costLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .white
        return label
    }()
    
    public init(frame: CGRect, totalValue: String, currentValue: String, cornerRadius: CGFloat) {
        super.init(frame: frame)
        setupCostLabel()
        self.costLabel.text = "\(totalValue)/\(currentValue)"
        backgroundColor = .black
        layer.cornerRadius = 17
    }
    
    func update(totalValue: String, currentValue: String) {
        self.costLabel.text = "\(totalValue)/\(currentValue)"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        setupBackgroundView()
//
//    }
    
    private func setupCostLabel() {
        addSubview(costLabel)
        costLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(17)
            make.top.equalToSuperview().offset(6)
            make.bottom.equalToSuperview().offset(-7)
            make.trailing.equalToSuperview().offset(-14)
        }
    }
}
