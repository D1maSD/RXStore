//
//  MockViewController.swift
//  RXStore
//
//  Created by Мельник Дмитрий on 18.07.2023.
//

import UIKit

class MockViewController: ViewController {
    
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let tableView = TableViewFactory.make()
    private let firestoreManager = FirestoreManager()
    var sweetArray = [ProductPage]()
    private var viewModel: MockViewModelProtocol
    private lazy var cardActionView = CardActionView(delegate: viewModel)
    
    init(viewModel: MockViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var currentPositionLabel = UILabel(text: "", color: .white)
    
        
    var images = [UIImage?]() {
        didSet {
            print(images.count)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
//        setupConstraints()
        setupCardActionView()
        loadData()
    }
}

extension MockViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        
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

extension MockViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell: ImageOfItemCell = tableView.dequeueReusableCell(for: indexPath)
            cell.selectionStyle = .none
            return cell
        case 1:
            let cell: PriceOfItemCell = tableView.dequeueReusableCell(for: indexPath)
            cell.selectionStyle = .none
            return cell
        case 2:
            let cell: BrandCell = tableView.dequeueReusableCell(for: indexPath)
            cell.selectionStyle = .none
            let sweet = sweetArray[indexPath.row]
                    
            cell.brandLabel.text = "\(sweet.brandName)"
//            cell.detailTextLabel?.text = "\(sweet.timeStamp)"
            return cell
        case 3:
            let cell: AboutItemCell = tableView.dequeueReusableCell(for: indexPath)
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
    func setupConstraints() {
        
    }
    
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
            $0.top.equalTo(self.view.snp.top)
            $0.bottom.equalTo(self.view.snp.bottom)
            $0.left.equalTo(self.view.snp.left)
            $0.right.equalTo(self.view.snp.right)
        }
    }
    
    func loadData() {
        FirestoreManager.db.collection("productPage").getDocuments() { querySnapshot, error in
            if let error = error {
                print("21 .\(error.localizedDescription)")
            } else {
                self.sweetArray = querySnapshot!.documents.flatMap({ProductPage(dictionary: $0.data())})
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            
        }
    }
}
