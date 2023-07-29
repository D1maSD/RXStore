//
//  MockViewController.swift
//  RXStore
//
//  Created by Мельник Дмитрий on 18.07.2023.
//

import UIKit
import SDWebImage
import RxSwift


class MockViewController: ViewController {
    
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let tableView = TableViewFactory.make()
    private let firestoreManager = FirestoreManager()
    private var sweetArray = [ProductPage]()
    private var viewModel: MockViewModelProtocol
    private lazy var cardActionView = CardActionView(delegate: viewModel)
    private let disposeBag = DisposeBag()
    
    private var aboutItemCellConfigurator: AboutItemCellConfigurator?
    private var brandCellConfigurator: BrandCellConfigurator?
    private var priceOfItemCellConfigurator: PriceOfItemCellConfigurator?
    private var imageOfItemCellConfigurator: ImageOfItemCellConfigurator?
    
    init(viewModel: MockViewModelProtocol) {
        self.viewModel = viewModel
        self.sweetArray = self.viewModel.sweetArray
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var currentPositionLabel = UILabel(text: "", color: .white)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCardActionView()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
        loadData()
    }
    
    func saveNewFiltersArray(filters: [String]) {
        let data = filters[0]
        loadData(categoryTitle: data)
    }
}

extension MockViewController: MockViewModelDelegate {
    
}

extension MockViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
    }
    
    private func setupCardActionView() {
        view.addSubview(cardActionView)
        cardActionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
    }
}

extension MockViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell: ImageOfItemCell = tableView.dequeueReusableCell(for: indexPath)
            imageOfItemCellConfigurator?.setupCell(cell)
            cell.selectionStyle = .none
            return cell
        case 1:
            let cell: PriceOfItemCell = tableView.dequeueReusableCell(for: indexPath)
            priceOfItemCellConfigurator?.setupCell(cell)
            cell.selectionStyle = .none
            return cell
        case 2:
            let cell: BrandCell = tableView.dequeueReusableCell(for: indexPath)
            brandCellConfigurator?.setupCell(cell)
            cell.selectionStyle = .none
            return cell
        case 3:
            let cell: AboutItemCell = tableView.dequeueReusableCell(for: indexPath)
            aboutItemCellConfigurator?.setupCell(cell)
            cell.selectionStyle = .none
            return cell
        default:
            fatalError("Index out of range")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension MockViewController {
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isUserInteractionEnabled = true
        tableView.register(ImageOfItemCell.self, forCellReuseIdentifier: "\(ImageOfItemCell.self)")
        tableView.register(PriceOfItemCell.self, forCellReuseIdentifier: "\(PriceOfItemCell.self)")
        tableView.register(BrandCell.self, forCellReuseIdentifier: "\(BrandCell.self)")
        tableView.register(AboutItemCell.self, forCellReuseIdentifier: "\(AboutItemCell.self)")
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(self.cardActionView.snp.bottom)
            $0.bottom.equalTo(self.view.snp.bottom)
            $0.left.equalTo(self.view.snp.left)
            $0.right.equalTo(self.view.snp.right)
        }
    }
    
    private func loadData(categoryTitle: String = "") {
        self.viewModel.loadData(categoryTitle: categoryTitle)
            .subscribe(onNext: { [weak self] response in
                guard let self = self else { return }
                let item = response[0]
                self.aboutItemCellConfigurator = AboutItemCellConfigurator(aboutProduct: "О товаре", descriptionProductLabel: item.detailedDescriptionOfProduct)
                
                self.brandCellConfigurator = BrandCellConfigurator(
                    brandLabel: item.brandName,
                    descriptionLabel: item.descriptionOfProduct,
                    rateLabel: item.rate,
                    ratesLabel: item.allRates,
                    articleLabel: item.articleNumber,
                    numberOfSalesLabel: item.numberOfPurchases
                )
                self.priceOfItemCellConfigurator = PriceOfItemCellConfigurator(
                    priceLabel: item.price,
                    oldPriceLabel: item.oldPrice,
                    colorLabel: "",
                    colorDescriptionLabel: item.color, url: item.otherColors
                )
                self.imageOfItemCellConfigurator = ImageOfItemCellConfigurator(imagesOfProduct: [UIImageView](), url: item.productPhotos)
                self.tableView.reloadData()
            })
            .disposed(by: disposeBag)
    }
}
