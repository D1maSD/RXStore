//
//  FilterCellConfigurator.swift
//  RXStore
//
//  Created by Мельник Дмитрий on 27.07.2023.
//

import UIKit

final class CellWithFilterSelectionConfigurator {

    private let type: CellWithFilterSelectionType
    private var cell: CellWithFilterSelection?
    private var buttonsToActivate: [FilterCheckedButtonType] = []
    private var showInAllCitiesButtonIsChecked: Bool?
    private var showInAllCitiesButtonEnabled: Bool?

    init(type: CellWithFilterSelectionType) {
        self.type = type
    }

    func setupCell(_ cell: UIView) {
        guard let cell = cell as? CellWithFilterSelection else { return }
        self.cell = cell
        cell.setup(
            type: type,
            buttonsToActivate: buttonsToActivate
        )
    }

    func activateFilterButtons(buttons: [FilterCheckedButtonType]) {
        buttonsToActivate = buttons
    }

    func clearSelectedCells() {
        buttonsToActivate = []
    }
}
