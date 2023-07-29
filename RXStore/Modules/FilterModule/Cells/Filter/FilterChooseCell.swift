//
//  FilterChooseCell.swift
//  RXStore
//
//  Created by Мельник Дмитрий on 28.07.2023.
//

import UIKit
import SwiftUI

protocol FilterChooseCellDelegate: AnyObject {
    func filterButtonTap(type: FilterCheckedButtonType, active: Bool)
}

final class FilterChooseCell: UICollectionViewCell {

    weak var delegate: FilterChooseCellDelegate?
    private var buttonType: FilterCheckedButtonType = .first

    private lazy var checkedButton = FilterCheckedButton(delegate: self)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(buttonType: FilterCheckedButtonType, filterChecked: Bool) {
        self.buttonType = buttonType
        configure(buttonType: buttonType, filterChecked: filterChecked)
    }

    func buttonCheck(isChecked: Bool) {
        checkedButton.updateState(isChecked: isChecked)
    }

    private func configure(buttonType: FilterCheckedButtonType, filterChecked: Bool) {
        checkedButton.configure(type: buttonType)
        buttonCheck(isChecked: filterChecked)
    }

    private func setupUI() {
        contentView.addSubview(checkedButton)
        checkedButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension FilterChooseCell: FilterCheckedButtonDelegate {
    func checkedButtonTap(checked: Bool) {
        print("26 .\(buttonType)")
        delegate?.filterButtonTap(type: buttonType, active: checkedButton.checked)
    }
}

