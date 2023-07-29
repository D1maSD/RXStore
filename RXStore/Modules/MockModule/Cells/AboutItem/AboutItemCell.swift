//
//  AboutItemCell.swift
//  RXStore
//
//  Created by Мельник Дмитрий on 24.07.2023.
//

import UIKit


final class AboutItemCell: UITableViewCell {
    
    private lazy var aboutProduct: UILabel = {
        let priceLabel = UILabel()
        priceLabel.font = .systemFont20Bold
        return priceLabel
    }()
    private lazy var descriptionProductLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.textColor = .gray
        priceLabel.numberOfLines = 10
        priceLabel.font = .systemFont16Medium
        return priceLabel
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    private func setup() {
                
        contentView.addSubview(aboutProduct)
        contentView.addSubview(descriptionProductLabel)
        
        aboutProduct.snp.makeConstraints {
            $0.top.equalTo(self.contentView.snp.top).offset(20)
            $0.left.equalToSuperview().offset(20)
            $0.height.equalTo(30)
        }
        descriptionProductLabel.snp.makeConstraints {
            $0.top.equalTo(self.aboutProduct.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.bottom.equalToSuperview()
        }
    }
    
    func setup(aboutProduct: String, descriptionProductLabel: String) {
        self.aboutProduct.text = aboutProduct
        self.descriptionProductLabel.text = descriptionProductLabel
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

