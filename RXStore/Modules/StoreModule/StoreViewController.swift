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
    private let tableView = TableViewFactory.make()
    private let sliderContentView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 500).isActive = true
        return view
    }()
    private let restInfoContentView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 600).isActive = true
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
        priceLabel.text = "4329 ₽"
        priceLabel.font = .systemFont20Bold
        return priceLabel
    }()
    
    private lazy var oldPriceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.text = "6499 ₽"
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
        priceLabel.textColor = .gray
        priceLabel.font = .systemFont16Medium
        return priceLabel
    }()
    private lazy var imageOfItem: UIImageView = {
        let imageOfItem = UIImageView()
        imageOfItem.layer.cornerRadius = 3
        imageOfItem.backgroundColor = .cyan
        return imageOfItem
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
    private lazy var separatorlViewTwo: UIView = {
        let verticalView = UIView()
        verticalView.backgroundColor = .gray
        return verticalView
    }()
    private lazy var brandLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.text = "Bosh"
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
    private lazy var verticalViewRate: UIView = {
        let verticalView = UIView()
        verticalView.backgroundColor = .gray
        return verticalView
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
        restInfoContentView.addSubview(priceLabel)
        restInfoContentView.addSubview(oldPriceLabel)
        restInfoContentView.addSubview(verticalView)
        restInfoContentView.addSubview(colorLabel)
        restInfoContentView.addSubview(colorDescriptionLabel)
        restInfoContentView.addSubview(imageOfItem)
        restInfoContentView.addSubview(separatorlView)
        restInfoContentView.addSubview(brandLabel)
        restInfoContentView.addSubview(rightChevron)
        restInfoContentView.addSubview(descriptionLabel)
        restInfoContentView.addSubview(ratesLabel)

        restInfoContentView.addSubview(star)
        restInfoContentView.addSubview(rateLabel)
        restInfoContentView.addSubview(ratesLabel)
        restInfoContentView.addSubview(articleLabel)
        restInfoContentView.addSubview(numberOfSalesLabel)
        restInfoContentView.addSubview(separatorlViewTwo)
        restInfoContentView.addSubview(aboutProduct)
        restInfoContentView.addSubview(descriptionProductLabel)
        restInfoContentView.addSubview(verticalViewRate)
        
        
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
        
        priceLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.left.equalToSuperview().offset(20)
            $0.height.equalTo(30)
//            $0.width.equalTo(70)
        }
        
        oldPriceLabel.snp.makeConstraints {
            $0.bottom.equalTo(self.priceLabel.snp.bottom)
            $0.left.equalTo(self.priceLabel.snp.right).offset(20)
            $0.height.equalTo(30)
//            $0.width.equalTo(70)
        }
        
        verticalView.snp.makeConstraints {
            $0.centerY.equalTo(self.oldPriceLabel.snp.centerY)
            $0.left.equalTo(self.oldPriceLabel.snp.left)
            $0.right.equalTo(self.oldPriceLabel.snp.right)
            $0.height.equalTo(1)
//            $0.width.equalTo(70)
        }
        
        colorLabel.snp.makeConstraints {
            $0.top.equalTo(self.priceLabel.snp.bottom).offset(5)
            $0.left.equalToSuperview().offset(20)
            $0.height.equalTo(30)
//            $0.width.equalTo(70)
        }
        colorDescriptionLabel.snp.makeConstraints {
            $0.centerY.equalTo(self.colorLabel.snp.centerY)
//            $0.top.equalTo(self.priceLabel.snp.bottom).offset(20)
            $0.left.equalTo(self.colorLabel.snp.right).offset(20)
            $0.height.equalTo(30)
//            $0.width.equalTo(70)
        }
        
        imageOfItem.snp.makeConstraints {
//            $0.centerY.equalTo(self.colorLabel.snp.centerY)
            $0.top.equalTo(self.colorLabel.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(20)
            $0.height.equalTo(70)
            $0.width.equalTo(50)
        }
        separatorlView.snp.makeConstraints {
            $0.centerX.equalTo(self.view.snp.centerX)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(20)
            $0.height.equalTo(1)
            $0.top.equalTo(self.imageOfItem.snp.bottom).offset(20)
        }
        
        brandLabel.snp.makeConstraints {
            $0.top.equalTo(self.separatorlView.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(20)
            $0.height.equalTo(30)
//            $0.width.equalTo(70)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(self.brandLabel.snp.bottom)
//            $0.top.equalTo(self.priceLabel.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(20)
            $0.height.equalTo(30)
//            $0.width.equalTo(70)
        }
//        star
        rightChevron.snp.makeConstraints {
//            $0.top.equalTo(self.separatorlView.snp.bottom).offset(20)
            $0.left.equalTo((self.brandLabel.snp.right)).offset(20)
            $0.height.equalTo(15)
            $0.width.equalTo(7)
            $0.centerY.equalTo(self.brandLabel.snp.centerY)
//            $0.width.equalTo(70)
        }
        star.snp.makeConstraints {
            $0.top.equalTo(self.descriptionLabel.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(20)
            $0.height.equalTo(14)
            $0.width.equalTo(14)
        }
//        rateLabel
        rateLabel.snp.makeConstraints {
            $0.bottom.equalTo(self.star.snp.bottom)
            $0.left.equalTo(self.star.snp.right).offset(3)
//            $0.centerY.equalTo(self.brandLabel.snp.centerY)
//            $0.width.equalTo(70)
        }
//        
        ratesLabel.snp.makeConstraints {
            $0.top.equalTo(self.rateLabel.snp.top)
            $0.left.equalTo(self.rateLabel.snp.right).offset(20)
            
//            $0.centerY.equalTo(self.brandLabel.snp.centerY)
//            $0.width.equalTo(70)
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
//            $0.centerY.equalTo(self.brandLabel.snp.centerY)
//            $0.width.equalTo(70)
        }
        
        numberOfSalesLabel.snp.makeConstraints {
            $0.top.equalTo(self.star.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(20)
        }
        separatorlViewTwo.snp.makeConstraints {
            $0.centerX.equalTo(self.view.snp.centerX)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(20)
            $0.height.equalTo(1)
            $0.top.equalTo(self.numberOfSalesLabel.snp.bottom).offset(20)
        }
        aboutProduct.snp.makeConstraints {
            $0.top.equalTo(self.separatorlViewTwo.snp.bottom).offset(20)
//            $0.top.equalTo(self.priceLabel.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(20)
            $0.height.equalTo(30)
//            $0.width.equalTo(70)
        }
        descriptionProductLabel.snp.makeConstraints {
            $0.top.equalTo(self.aboutProduct.snp.bottom).offset(20)
//            $0.top.equalTo(self.priceLabel.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
//            $0.height.equalTo(30)
//            $0.width.equalTo(70)
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
