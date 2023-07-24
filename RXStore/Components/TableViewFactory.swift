//
//  TableViewFactory.swift
//  RXStore
//
//  Created by Мельник Дмитрий on 23.07.2023.
//

import UIKit

struct TableViewFactory {
    static func make(scrollIndicatorOff: Bool = true) -> UITableView {
        let table = UITableView(frame: .zero, style: .plain)
        if scrollIndicatorOff {
            table.showsVerticalScrollIndicator = false
            table.showsHorizontalScrollIndicator = false
        }
        return table
    }
}

