//
//  NewsCell.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 08.10.2022.
//

import UIKit


final class ImageOfItemCell: UITableViewCell, UIScrollViewDelegate {
    
    private lazy var view0: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .systemTeal
        let label = UILabel()
        label.text = "Page 0"
        label.textAlignment = .center
        return view
    }()
    
    private lazy var view1: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .systemPink
        let label = UILabel()
        label.text = "Page 1"
        label.textAlignment = .center
        return view
    }()
    
    private lazy var view2: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .systemYellow
        let label = UILabel()
        label.text = "Page 2"
        label.textAlignment = .center
        return view
    }()
    
    private lazy var imageScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: contentView.frame.width * CGFloat(views.count), height: 500)
        scrollView.backgroundColor = .systemGray
        view0.backgroundColor = .green
        view1.backgroundColor = .red
        view2.backgroundColor = .blue
        
        for i in 0..<views.count {
            scrollView.addSubview(views[i])
            
            views[i].frame = CGRect(x: contentView.frame.width * CGFloat(i), y: 0, width: contentView.frame.width, height: 500)
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
    private lazy var views = [view0, view1, view2]
    private lazy var pageControlLabel: PageControlLabel = {
        let pageControl = PageControlLabel(
            frame: .zero,
            totalValue: String(views.count),
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
//        imageScrollView.edgeTo(view: contentView)
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
