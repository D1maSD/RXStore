//
//  PriceOfItemCell.swift
//  RXStore
//
//  Created by Мельник Дмитрий on 24.07.2023.
//

import UIKit
import SDWebImage


final class PriceOfItemCell: UITableViewCell {
    
    private let restInfoContentView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 300).isActive = true
        return view
    }()
    private lazy var priceLabel: UILabel = {
        let priceLabel = UILabel()
//        priceLabel.text = "4329 ₽"
        priceLabel.font = .systemFont20Bold
        return priceLabel
    }()
    private lazy var imageUrls = [URL]()
    private var isBeingOnCycle = false
    private lazy var oldPriceLabel: UILabel = {
        let priceLabel = UILabel()
//        priceLabel.text = "6499 ₽"
        priceLabel.textColor = .gray
        priceLabel.font = .systemFont16Medium
        return priceLabel
    }()
    private lazy var colorLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.text = "Цвет:"
        priceLabel.textColor = .gray
        priceLabel.font = .systemFont16Medium
        return priceLabel
    }()

    private lazy var colorDescriptionLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.text = "Зеленый, изумрудно зеленый"
        priceLabel.textColor = .black
        priceLabel.numberOfLines = 2
        priceLabel.font = .systemFont16Medium
        return priceLabel
    }()
    private lazy var verticalView: UIView = {
        let verticalView = UIView()
        verticalView.backgroundColor = .gray
        return verticalView
    }()
    private lazy var separatorlView: UIView = {
        let verticalView = UIView()
        verticalView.backgroundColor = .gray
        return verticalView
    }()
    
    private lazy var views = [imageOfItem, imageOfItem1, imageOfItem2, imageOfItem3, imageOfItem4, imageOfItem5]
    
    private lazy var imageOfItem: UIImageView = {
        let imageOfItem = UIImageView()
        imageOfItem.layer.cornerRadius = 3
        imageOfItem.backgroundColor = .cyan
        return imageOfItem
    }()
    private lazy var imageOfItem1: UIImageView = {
        let imageOfItem = UIImageView()
        imageOfItem.layer.cornerRadius = 3
        imageOfItem.backgroundColor = .cyan
        return imageOfItem
    }()
    private lazy var imageOfItem2: UIImageView = {
        let imageOfItem = UIImageView()
        imageOfItem.layer.cornerRadius = 3
        imageOfItem.backgroundColor = .cyan
        return imageOfItem
    }()
    private lazy var imageOfItem3: UIImageView = {
        let imageOfItem = UIImageView()
        imageOfItem.layer.cornerRadius = 3
        imageOfItem.backgroundColor = .cyan
        return imageOfItem
    }()
    private lazy var imageOfItem4: UIImageView = {
        let imageOfItem = UIImageView()
        imageOfItem.layer.cornerRadius = 3
        imageOfItem.backgroundColor = .cyan
        return imageOfItem
    }()
    private lazy var imageOfItem5: UIImageView = {
        let imageOfItem = UIImageView()
        imageOfItem.layer.cornerRadius = 3
        imageOfItem.backgroundColor = .cyan
        return imageOfItem
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    private func setup() {
        
        contentView.addSubview(priceLabel)
        contentView.addSubview(oldPriceLabel)
        contentView.addSubview(verticalView)
        contentView.addSubview(colorLabel)
        contentView.addSubview(colorDescriptionLabel)
        
        
        
        contentView.addSubview(imageOfItem)
        contentView.addSubview(imageOfItem1)
        contentView.addSubview(imageOfItem2)
        contentView.addSubview(imageOfItem3)
        contentView.addSubview(imageOfItem4)
        contentView.addSubview(imageOfItem5)
        
        
        
        contentView.addSubview(separatorlView)

        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(self.contentView.snp.top).offset(20)
            $0.left.equalTo(self.contentView.snp.left).offset(20)
            $0.height.equalTo(30)
        }
        
        oldPriceLabel.snp.makeConstraints {
            $0.bottom.equalTo(self.priceLabel.snp.bottom)
            $0.left.equalTo(self.priceLabel.snp.right).offset(20)
            $0.height.equalTo(30)
        }
        
        verticalView.snp.makeConstraints {
            $0.centerY.equalTo(self.oldPriceLabel.snp.centerY)
            $0.left.equalTo(self.oldPriceLabel.snp.left)
            $0.right.equalTo(self.oldPriceLabel.snp.right)
            $0.height.equalTo(1)
        }
        
        colorLabel.snp.makeConstraints {
            $0.top.equalTo(self.priceLabel.snp.bottom).offset(5)
            $0.left.equalTo(self.contentView.snp.left).offset(20)
            $0.height.equalTo(30)
        }
        colorDescriptionLabel.snp.makeConstraints {
            $0.centerY.equalTo(self.colorLabel.snp.centerY)
            $0.left.equalTo(self.colorLabel.snp.right).offset(20)
            $0.height.equalTo(30)
        }
        
        
        
        
        imageOfItem.snp.makeConstraints {
            $0.top.equalTo(self.colorLabel.snp.bottom).offset(20)
            $0.left.equalTo(self.contentView.snp.left).offset(15)
            $0.height.equalTo(70)
            $0.width.equalTo(50)
        }
        imageOfItem1.snp.makeConstraints {
            $0.top.equalTo(self.colorLabel.snp.bottom).offset(20)
            $0.left.equalTo(self.imageOfItem.snp.right).offset(15)
            $0.height.equalTo(70)
            $0.width.equalTo(50)
        }
        imageOfItem2.snp.makeConstraints {
            $0.top.equalTo(self.colorLabel.snp.bottom).offset(20)
            $0.left.equalTo(self.imageOfItem1.snp.right).offset(15)
            $0.height.equalTo(70)
            $0.width.equalTo(50)
        }
        imageOfItem3.snp.makeConstraints {
            $0.top.equalTo(self.colorLabel.snp.bottom).offset(20)
            $0.left.equalTo(self.imageOfItem2.snp.right).offset(15)
            $0.height.equalTo(70)
            $0.width.equalTo(50)
        }
        imageOfItem4.snp.makeConstraints {
            $0.top.equalTo(self.colorLabel.snp.bottom).offset(20)
            $0.left.equalTo(self.imageOfItem3.snp.right).offset(15)
            $0.height.equalTo(70)
            $0.width.equalTo(50)
        }
        imageOfItem5.snp.makeConstraints {
            $0.top.equalTo(self.colorLabel.snp.bottom).offset(20)
            $0.left.equalTo(self.imageOfItem4.snp.right).offset(15)
            $0.height.equalTo(70)
            $0.width.equalTo(50)
        }
        
        
        
        
        
        separatorlView.snp.makeConstraints {
            $0.centerX.equalTo(self.contentView.snp.centerX)
            $0.left.equalTo(self.contentView.snp.left).offset(20)
            $0.right.equalTo(self.contentView.snp.right).offset(-20)
            $0.height.equalTo(1)
            $0.top.equalTo(self.imageOfItem.snp.bottom).offset(20)
            $0.bottom.equalTo(self.contentView.snp.bottom)
        }
    }
    
    func setup(
        priceLabel: String,
        oldPriceLabel: String,
        colorLabel: String,
        colorDescriptionLabel: String,
        url: [String]
    ) {
        self.priceLabel.text = "\(priceLabel) ₽"
        self.oldPriceLabel.text = "\(oldPriceLabel) ₽"
        self.colorLabel.text = "Цвет: "
        self.colorDescriptionLabel.text = colorDescriptionLabel
//        self.imageUrls = url
        if !isBeingOnCycle {
            for i in url {
                
                self.isBeingOnCycle = true
                let url = URL(string: "https://\(i)")
                guard let url = url else {return}
                print("21 .url \(url)")
                self.imageUrls.append(url)
                
                let image = UIImageView()
                image.sd_setImage(with: url)
//                self.imagesOfProduct.append(image)
            }
        }
        
        setupToImage(imagesOfProduct: views, urls: imageUrls)
    }
    
    func setupToImage(imagesOfProduct: [UIImageView], urls: [URL]) {
            for (index, urlString) in urls.enumerated() {
                let imageView = imagesOfProduct[index]
                    imageView.sd_setImage(with: urlString)
            }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

