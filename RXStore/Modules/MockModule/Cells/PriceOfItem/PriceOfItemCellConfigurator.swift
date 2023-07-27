//
//  PriceOfItemCellConfigurator.swift
//  RXStore
//
//  Created by Мельник Дмитрий on 26.07.2023.
//

import UIKit

final class PriceOfItemCellConfigurator: ListCellConfiguration {
    private var priceLabel: String?
    private var oldPriceLabel: String?
    private var colorLabel: String?
    private var colorDescriptionLabel: String?
    
    init(
        priceLabel: String,
        oldPriceLabel: String,
        colorLabel: String,
        colorDescriptionLabel: String
    ) {
        self.priceLabel = priceLabel
        self.oldPriceLabel = oldPriceLabel
        self.colorLabel = colorLabel
        self.colorDescriptionLabel = colorDescriptionLabel
    }
    
    func setupCell(_ cell: UIView) {
        //        guard let cell = cell as? PriceOfItemCell else { return }
        
        guard
            let cell = cell as? PriceOfItemCell,
            let priceLabel = priceLabel,
            let oldPriceLabel = oldPriceLabel,
            let colorLabel = colorLabel,
            let colorDescriptionLabel = colorDescriptionLabel else { return }
        
        cell.setup(
            priceLabel: priceLabel,
            oldPriceLabel: oldPriceLabel,
            colorLabel: colorLabel,
            colorDescriptionLabel: colorDescriptionLabel
        )
    }
    
    func getCell() -> UITableViewCell {
        return UITableViewCell()
    }
}

