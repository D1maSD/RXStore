//
//  NewsCell.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 08.10.2022.
//

import UIKit
import SDWebImage

final class ImageOfItemCell: UITableViewCell, UIScrollViewDelegate {
    
    private var view0 = UIImageView()
    private var view1 = UIImageView()
    private var view2 = UIImageView()
    private var view3 = UIImageView()
    private var view4 = UIImageView()
    private var view5 = UIImageView()
    
    private var isBeingOnCycle = false
    
    private lazy var imageScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: contentView.frame.width * CGFloat(views.count), height: 500)
        scrollView.backgroundColor = .systemGray
        
        for i in 0..<views.count {
            scrollView.addSubview(views[i])
            views[i].frame = CGRect(x: contentView.frame.width * CGFloat(i), y: 0, width: contentView.frame.width + 50, height: 500)
        }
        scrollView.delegate = self
        return scrollView
    }()
    
    private lazy var pageControl: PageControlView = {
        let pageControl = PageControlView(
            frame: .zero,
            label: "Hi",
            icon: UIImage(),
            cornerRadius: 10)
        pageControl.numberOfPages = views.count
        pageControl.currentPage = 0
        pageControl.addTarget(self, action: #selector(pageControlTapHandler(sender:)), for: .touchUpInside)
        return pageControl
    }()
    private lazy var views = [view0, view1, view2, view3, view4, view5]
    private lazy var imagesOfProduct = [UIImageView]()
    let image = UIImageView()
    private lazy var imageUrls = [URL]()
    private lazy var pageControlLabel: PageControlLabel = {
        let pageControl = PageControlLabel(
            frame: .zero,
            totalValue: String(imagesOfProduct.count),
            currentValue: String(1),
            cornerRadius: 10
        )
        return pageControl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    private func setup() {
        
        contentView.addSubview(imageScrollView)
        contentView.addSubview(pageControl)
        contentView.addSubview(pageControlLabel)
        imageScrollView.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).offset(0)
            $0.bottom.equalTo(contentView.snp.bottom).offset(0)
            $0.leading.equalTo(contentView.snp.leading)
            $0.trailing.equalTo(contentView.snp.trailing)
            $0.height.equalTo(500)
        }
        pageControl.snp.makeConstraints {
            $0.centerX.equalTo(self.imageScrollView.snp.centerX)
            $0.bottom.equalTo(self.imageScrollView.snp.bottom).offset(-12)
            $0.height.equalTo(50)
            $0.width.equalTo(100)
        }
        pageControlLabel.snp.makeConstraints {
            $0.centerY.equalTo(self.pageControl.snp.centerY)
            $0.bottom.equalTo(self.imageScrollView.snp.bottom).offset(-12)
            $0.left.equalTo(self.imageScrollView.snp.left).offset(20)
            $0.height.equalTo(30)
            $0.width.equalTo(60)
        }
    }
    
    @objc
    func pageControlTapHandler(sender: UIPageControl) {
        imageScrollView.scrollTo(horizontalPage: sender.currentPage, animated: true)
    }
    
    func setup(
        imagesOfProduct: [UIImageView],
        urls: [String]
    ) {
        self.imageUrls = []
        self.imagesOfProduct = []
            for i in urls {
                
                self.isBeingOnCycle = true
                let url = URL(string: "https://\(i)")
                guard let url = url else {return}
                self.imageUrls.append(url)
                let image = UIImageView()
                image.sd_setImage(with: url)
                self.imagesOfProduct.append(image)
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / contentView.frame.width)
        pageControl.currentPage = Int(pageIndex)
        pageControlLabel.update(totalValue: String(views.count - 1), currentValue: String(Int(pageIndex + 1)))
    }
}
