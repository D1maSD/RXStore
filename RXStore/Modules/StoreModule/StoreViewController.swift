//
//  ViewController.swift
//  RXStore
//
//  Created by Мельник Дмитрий on 18.07.2023.
//

import UIKit

class StoreViewController: ViewController {
    
    private let scrollViewContainer: UIStackView = {
        let view = UIStackView()

        view.axis = .vertical
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let sliderContentView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 500).isActive = true
        return view
    }()
    private let restInfoContentView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 500).isActive = true
        return view
    }()
    
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
    
    private var viewModel: StoreViewModelProtocol
    private lazy var cardActionView = CardActionView(delegate: viewModel)
    private lazy var views = [view0, view1, view2]
    private lazy var imageScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(views.count), height: 500)
        scrollView.backgroundColor = .systemGray
        view0.backgroundColor = .green
        view1.backgroundColor = .red
        view2.backgroundColor = .blue
        
        for i in 0..<views.count {
            scrollView.addSubview(views[i])
            
            views[i].frame = CGRect(x: sliderContentView.frame.width * CGFloat(i), y: 0, width: sliderContentView.frame.width, height: 500)
        }
        
        scrollView.delegate = self
        
        return scrollView
    }()
    
    private let filterButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "filterBlack"), for: .normal)
        return button
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
    
    private lazy var pageControlLabel: PageControlLabel = {
        let pageControl = PageControlLabel(
            frame: .zero,
            totalValue: String(views.count),
            currentValue: String(1),
            cornerRadius: 10
        )
        return pageControl
    }()
    
    private lazy var priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.font = .systemFont14Medium
        return priceLabel
    }()
    
    init(viewModel: StoreViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var currentPositionLabel = UILabel(text: "", color: .white)
    
    private lazy var similarButton: CardButton = {
        let button = CardButton(
            frame: .zero,
            label: "Похожие",
            //NOTE: Здесь картинку поиска
            icon: UIImage(),
            cornerRadius: 10
        )
        button.backgroundColor = .systemYellow
        return button
    }()
    
    private lazy var currencyButton: CardButton = {
        let button = CardButton(
            frame: .zero,
            label: "RUB",
            //NOTE: Здесь картинку страны
            icon: UIImage(),
            cornerRadius: 5
        )
        button.backgroundColor = .systemYellow
        return button
    }()
    
    @objc
    func pageControlTapHandler(sender: UIPageControl) {
        imageScrollView.scrollTo(horizontalPage: sender.currentPage, animated: true)
    }
    
    var images = [UIImage?]() {
        didSet {
            print(images.count)
        }
    }
    
    var photoCards: UIView = UIView()
    
//    var filterButton = UIButton()
//    var likeButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupConstraints()
        setupCardActionView()
        
        self.view.backgroundColor = .white
        sliderContentView.addSubview(imageScrollView)
        imageScrollView.edgeTo(view: sliderContentView)
        
        sliderContentView.addSubview(pageControl)
        sliderContentView.addSubview(pageControlLabel)
        restInfoContentView
        
        pageControl.snp.makeConstraints {
            $0.centerX.equalTo(self.imageScrollView.snp.centerX)
            $0.bottom.equalTo(self.imageScrollView.snp.bottom).offset(-12)
//            $0.left.equalTo(self.imageScrollView.snp.left)
//            $0.right.equalTo(self.imageScrollView.snp.right)
            $0.height.equalTo(50)
            $0.width.equalTo(100)
        }
        
        pageControlLabel.snp.makeConstraints {
            $0.centerY.equalTo(self.pageControl.snp.centerY)
            $0.bottom.equalTo(self.imageScrollView.snp.bottom).offset(-12)
            $0.left.equalTo(self.imageScrollView.snp.left).offset(20)
//            $0.right.equalTo(self.imageScrollView.snp.right)
            $0.height.equalTo(30)
            $0.width.equalTo(60)
        }
    }
}


extension StoreViewController {
    func setupConstraints() {
        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)
        
        scrollViewContainer.addArrangedSubview(sliderContentView)
        scrollViewContainer.addArrangedSubview(restInfoContentView)
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        self.view.backgroundColor = .white
    }
}

extension StoreViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        pageControlLabel.update(totalValue: String(views.count), currentValue: String(Int(pageIndex + 1)))
    }
    
    private func setupCardActionView() {
        view.addSubview(cardActionView)
        cardActionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
    }
}