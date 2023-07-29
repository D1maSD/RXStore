//
//  ImageOfItemCellConfigurator.swift
//  RXStore
//
//  Created by Мельник Дмитрий on 26.07.2023.
//

import UIKit

final class ImageOfItemCellConfigurator: ListCellConfiguration {
    private var url: [String]?
    private var currentPage: String?
    
    init(imagesOfProduct: [UIImageView], url: [String]) {
        self.url = url
    }

    func setupCell(_ cell: UIView) {
        guard let cell = cell as? ImageOfItemCell, let url = url else { return }
        cell.setup(imagesOfProduct: [UIImageView](), urls: url)
    }

    func getCell() -> UITableViewCell {
        return UITableViewCell()
    }
}
