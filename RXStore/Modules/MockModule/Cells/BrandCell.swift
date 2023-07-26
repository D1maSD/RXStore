//
//  BrandCell.swift
//  RXStore
//
//  Created by Мельник Дмитрий on 24.07.2023.
//

import UIKit


final class BrandCell: UITableViewCell {
    
    var brandLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.text = "Some brand"
        priceLabel.font = .systemFont20Bold
        return priceLabel
    }()
    
    private lazy var rightChevron: UIImageView = {
        let rightChevron = UIImageView()
        rightChevron.image = UIImage(named: "chevronRight")
        return rightChevron
    }()
    private lazy var star: UIImageView = {
        let star = UIImageView()
        star.image = UIImage(named: "star")
        return star
    }()
//    UIImage(named: "star")
    private lazy var descriptionLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.text = "Фен для волос с насадками с диффузаром"
        priceLabel.textColor = .gray
        priceLabel.font = .systemFont16Medium
        return priceLabel
    }()
    private lazy var separatorlViewTwo: UIView = {
        let verticalView = UIView()
        verticalView.backgroundColor = .gray
        return verticalView
    }()
    private lazy var rateLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.text = "3.9"
        priceLabel.textColor = .black
        priceLabel.font = .systemFont16Medium
        return priceLabel
    }()
    private lazy var ratesLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.text = "35 оценок"
        priceLabel.textColor = .black
        priceLabel.font = .systemFont14Medium
        return priceLabel
    }()
    private lazy var articleLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.text = "Арт: 140046250"
        priceLabel.textColor = .black
        priceLabel.font = .systemFont16Medium
        return priceLabel
    }()
    private lazy var numberOfSalesLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.text = "Купили более 300 раз"
        priceLabel.textColor = .black
        priceLabel.font = .systemFont16Medium
        return priceLabel
    }()
    private lazy var verticalViewRate: UIView = {
        let verticalView = UIView()
        verticalView.backgroundColor = .gray
        return verticalView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    private func setup() {
                    
        contentView.addSubview(brandLabel)
        contentView.addSubview(rightChevron)
        contentView.addSubview(star)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(rateLabel)
        contentView.addSubview(ratesLabel)
        contentView.addSubview(articleLabel)
        contentView.addSubview(numberOfSalesLabel)
        contentView.addSubview(separatorlViewTwo)
        contentView.addSubview(verticalViewRate)
        
        brandLabel.snp.makeConstraints {
            $0.top.equalTo(self.contentView.snp.top).offset(20)
            $0.left.equalToSuperview().offset(20)
            $0.height.equalTo(30)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(self.brandLabel.snp.bottom)
            $0.left.equalToSuperview().offset(20)
            $0.height.equalTo(30)
        }
        rightChevron.snp.makeConstraints {
            $0.left.equalTo((self.brandLabel.snp.right)).offset(20)
            $0.height.equalTo(15)
            $0.width.equalTo(7)
            $0.centerY.equalTo(self.brandLabel.snp.centerY)
        }
        star.snp.makeConstraints {
            $0.top.equalTo(self.descriptionLabel.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(20)
            $0.height.equalTo(14)
            $0.width.equalTo(14)
        }
        rateLabel.snp.makeConstraints {
            $0.bottom.equalTo(self.star.snp.bottom)
            $0.left.equalTo(self.star.snp.right).offset(3)
        }
        ratesLabel.snp.makeConstraints {
            $0.top.equalTo(self.rateLabel.snp.top)
            $0.left.equalTo(self.rateLabel.snp.right).offset(20)
        }
        verticalViewRate.snp.makeConstraints {
            $0.top.equalTo(self.ratesLabel.snp.bottom).offset(2)
            $0.left.equalTo(self.ratesLabel.snp.left)
            $0.right.equalTo(self.ratesLabel.snp.right)
            $0.height.equalTo(1)
        }
        articleLabel.snp.makeConstraints {
            $0.top.equalTo(self.rateLabel.snp.top)
            $0.left.equalTo(self.ratesLabel.snp.right).offset(10)
            $0.centerY.equalTo(self.rateLabel.snp.centerY)
        }
        numberOfSalesLabel.snp.makeConstraints {
            $0.top.equalTo(self.star.snp.bottom).offset(20)
            $0.left.equalTo(self.contentView.snp.left).offset(20)
        }
        separatorlViewTwo.snp.makeConstraints {
            $0.centerX.equalTo(self.contentView.snp.centerX)
            $0.left.equalTo(self.contentView.snp.left).offset(20)
            $0.right.equalTo(self.contentView.snp.right).offset(20)
            $0.height.equalTo(1)
            $0.top.equalTo(self.numberOfSalesLabel.snp.bottom).offset(20)
            $0.bottom.equalTo(self.contentView.snp.bottom)
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

