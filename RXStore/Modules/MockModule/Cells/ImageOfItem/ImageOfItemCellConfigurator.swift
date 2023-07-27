//
//  ImageOfItemCellConfigurator.swift
//  RXStore
//
//  Created by Мельник Дмитрий on 26.07.2023.
//

import UIKit

final class ImageOfItemCellConfigurator: ListCellConfiguration {
    private var imagesOfProduct: [UIImage]?
    private var url: String?
    
    init(imagesOfProduct: [UIImage], url: String) {
        self.imagesOfProduct = imagesOfProduct
        self.url = url
    }

    func setupCell(_ cell: UIView) {
        guard let cell = cell as? ImageOfItemCell, let images = imagesOfProduct else { return }
        cell.setup(imagesOfProduct: images)
    }

    func getCell() -> UITableViewCell {
        return UITableViewCell()
    }
}
