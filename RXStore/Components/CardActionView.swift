//
//  CardActionView.swift
//  RXStore
//
//  Created by Мельник Дмитрий on 20.07.2023.
//

import UIKit

protocol CardActionViewDelegate: AnyObject {
    func reloadButtonTap()
    func filterButtonTap()
}

final class CardActionView: UIView {

    private weak var delegate: CardActionViewDelegate?

    private let filterButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "filterBlack"), for: .normal)
        return button
    }()

    private let rxStoreLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont20Bold
        label.text = "RXStore"
        label.textAlignment = .center
        return label
    }()

    init(delegate: CardActionViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        self.backgroundColor = .lightGray
        setupUI()
        configure()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        filterButton.addTarget(self, action: #selector(filterButtonTap), for: .touchUpInside)
    }

    private func setupUI() {
        setupFilterButton()
    }

    private func setupFilterButton() {
        addSubview(filterButton)
        filterButton.snp.makeConstraints { make in
            make.size.equalTo(50)
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
        }

        addSubview(rxStoreLabel)
        rxStoreLabel.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.height.equalTo(50)
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(self.snp.centerY)
        }
    }

    @objc private func filterButtonTap() {
        delegate?.filterButtonTap()
    }
}

