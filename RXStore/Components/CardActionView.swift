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

    private let reloadButton = ReloadButton()
    private let filterButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "filterBlack"), for: .normal)
        return button
    }()

    init(delegate: CardActionViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        self.backgroundColor = .green
        setupUI()
        configure()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func startLoadingAnimation() {
        reloadButton.startLoadingAnimation()
    }

    func stopLoadingAnimation() {
        reloadButton.stopLoadingAnimation()
    }

    private func configure() {
//        reloadButton.addTarget(self, action: #selector(reloadButtonTap), for: .touchUpInside)
        filterButton.addTarget(self, action: #selector(filterButtonTap), for: .touchUpInside)
    }

    private func setupUI() {
        setupReloadButton()
        setupFilterButton()
    }

    private func setupReloadButton() {
        addSubview(reloadButton)
        reloadButton.snp.makeConstraints { make in
            make.size.equalTo(50)
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
        }
    }

    private func setupFilterButton() {
        addSubview(filterButton)
        filterButton.snp.makeConstraints { make in
            make.size.equalTo(50)
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
        }
    }

    @objc private func reloadButtonTap() {
//        print("reloadButtonTap()")
        delegate?.reloadButtonTap()
    }

    @objc private func filterButtonTap() {
//        print("filterButtonTap()")
        delegate?.filterButtonTap()
    }
}

