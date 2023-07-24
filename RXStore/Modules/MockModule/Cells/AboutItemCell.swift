//
//  AboutItemCell.swift
//  RXStore
//
//  Created by Мельник Дмитрий on 24.07.2023.
//

import UIKit


final class PriceOfItemCell: UITableViewCell {
    
    private let restInfoContentView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 300).isActive = true
        return view
    }()
    private lazy var aboutProduct: UILabel = {
        let priceLabel = UILabel()
        priceLabel.text = "О товаре"
        priceLabel.font = .systemFont20Bold
        return priceLabel
    }()
    private lazy var descriptionProductLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.text = "Функциональный и удобный фен BS-7799 отличается красивым дизайном и доступной ценой с большим набором функций. Отличается высоким качеством и надежностью, бережно сушит волосы. Это мощный и универсальный инструмент, с помощью которого можно не только высушить, но и аккуратно уложить ваши волосы."
        priceLabel.textColor = .gray
        priceLabel.numberOfLines = 5
        priceLabel.font = .systemFont16Medium
        return priceLabel
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    private func setup() {
        contentView.addSubview(restInfoContentView)
        
//        restInfoContentView.addSubview(priceLabel)
        
        restInfoContentView.addSubview(aboutProduct)
        restInfoContentView.addSubview(descriptionProductLabel)
        
        aboutProduct.snp.makeConstraints {
            $0.top.equalTo(self.restInfoContentView.snp.top).offset(20)
            $0.left.equalToSuperview().offset(20)
            $0.height.equalTo(30)
        }
        descriptionProductLabel.snp.makeConstraints {
            $0.top.equalTo(self.aboutProduct.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

