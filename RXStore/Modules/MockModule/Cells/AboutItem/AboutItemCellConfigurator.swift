//
//  AboutItemCellConfigurator.swift
//  RXStore
//
//  Created by Мельник Дмитрий on 26.07.2023.
//

import UIKit

final class AboutItemCellConfigurator: ListCellConfiguration {
    private var aboutProduct: String?
    private var descriptionProductLabel: String?

    init(aboutProduct: String, descriptionProductLabel: String) {
        self.aboutProduct = aboutProduct
        self.descriptionProductLabel = descriptionProductLabel
    }

    func setupCell(_ cell: UIView) {
        guard let cell = cell as? AboutItemCell, let aboutProduct = aboutProduct, let description = descriptionProductLabel  else { return }
        cell.setup(aboutProduct: aboutProduct, descriptionProductLabel: description)
    }

    func getCell() -> UITableViewCell {
        return UITableViewCell()
    }
}

