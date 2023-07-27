//
//  BrandCellConfigurator.swift
//  RXStore
//
//  Created by Мельник Дмитрий on 26.07.2023.
//

import UIKit

final class BrandCellConfigurator: ListCellConfiguration {
   
    private var brandLabel: String?
    private var descriptionLabel: String?
    private var rateLabel: String?
    private var ratesLabel: String?
    private var articleLabel: String?
    private var numberOfSalesLabel: String?

    init(
        brandLabel: String,
        descriptionLabel: String,
        rateLabel: String,
        ratesLabel: String,
        articleLabel: String,
        numberOfSalesLabel: String
    ) {
        self.brandLabel = brandLabel
        self.descriptionLabel = descriptionLabel
        self.rateLabel = rateLabel
        self.ratesLabel = ratesLabel
        self.articleLabel = articleLabel
        self.numberOfSalesLabel = numberOfSalesLabel
    }

    func setupCell(_ cell: UIView) {
//        guard let cell = cell as? BrandCell else { return }
        guard
            let cell = cell as? BrandCell,
                let brandLabel = brandLabel,
                let descriptionLabel = descriptionLabel,
                let rateLabel = rateLabel,
                let ratesLabel = ratesLabel,
                let articleLabel = articleLabel,
                let numberOfSalesLabel = numberOfSalesLabel else { return }
        
        cell.setup(
            brandLabel: brandLabel,
            descriptionLabel: descriptionLabel,
            rateLabel: rateLabel,
            ratesLabel: ratesLabel,
            articleLabel: articleLabel,
            numberOfSalesLabel: numberOfSalesLabel
        )
    }

    func getCell() -> UITableViewCell {
        return UITableViewCell()
    }
}

