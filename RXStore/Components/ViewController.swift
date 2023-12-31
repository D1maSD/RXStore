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
    }
    
    func setup() {
        self.view.backgroundColor = .systemGray
    }
    
    func setupLayout() {}
    
    func setupUI() {}
}
