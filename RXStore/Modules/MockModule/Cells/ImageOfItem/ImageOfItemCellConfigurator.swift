//
//  ImageOfItemCellConfigurator.swift
//  RXStore
//
//  Created by Мельник Дмитрий on 26.07.2023.
//

import UIKit

final class ImageOfItemCellConfigurator: ListCellConfiguration {
//    private var imagesOfProduct: [UIImage]?
    private var url: [String]?
    
    init(imagesOfProduct: [UIImageView], url: [String]) {
//        self.imagesOfProduct = imagesOfProduct
        self.url = url
    }

    func setupCell(_ cell: UIView) {
//        guard let cell = cell as? ImageOfItemCell, let images = imagesOfProduct, let url = url else { return }
        guard let cell = cell as? ImageOfItemCell, let url = url else { return }
        print("21 .url \(url)")
        cell.setup(imagesOfProduct: [UIImageView](), urls: url)
    }

    func getCell() -> UITableViewCell {
        return UITableViewCell()
    }
}
