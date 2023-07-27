//
//  ListCellConfiguration.swift
//  RXStore
//
//  Created by Мельник Дмитрий on 26.07.2023.
//

import UIKit

protocol ListCellConfiguration: AnyObject {
    func setupCell(_ cell: UIView)
}

