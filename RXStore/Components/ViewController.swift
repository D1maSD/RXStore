//
//  ViewController.swift
//  RXStore
//
//  Created by Мельник Дмитрий on 21.07.2023.
//

import UIKit


class ViewController: UIViewController {
    
    var backTap: (() -> Void)?
    var navigationBar: CustomNavigationBarView?
//    internal lazy var headerView = MainHeaderView(type: type, delegate: self)
    var rightButttonTap: (() -> Void)?
    var navBarTitle: ((String) -> Void)?
    var navigationType: NavigationType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setup()
        setupUI()
        setupHeader()
    }
    
    private func setupHeader() {
//        contentView.addSubview(headerView)
//        headerView.snp.makeConstraints { make in
//            make.top.equalToSuperview()
//            make.leading.trailing.equalToSuperview()
//        }
    }
    
    func setup() {}
    
    func setupLayout() {}
    
    func setupUI() {}
}
