//
//  FilterChooseCellConfigurator.swift
//  RXStore
//
//  Created by Мельник Дмитрий on 28.07.2023.
//

import UIKit

final class FilterChooseCellConfigurator {

    let buttonType: FilterCheckedButtonType
    private var cell: FilterChooseCell?
    private var filterChecked: Bool = false

    init(buttonType: FilterCheckedButtonType) {
        self.buttonType = buttonType
    }

    func setupCell(_ cell: UIView) {
        guard let cell = cell as? FilterChooseCell else { return }
        self.cell = cell
        cell.setup(buttonType: buttonType, filterChecked: filterChecked)
    }

    func buttonCheck() {
        filterChecked = true
    }
}

