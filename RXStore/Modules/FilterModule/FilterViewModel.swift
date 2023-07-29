//
//  FilterViewModel.swift
//  RXStore
//
//  Created by Мельник Дмитрий on 27.07.2023.
//

import Foundation
//import UseCases

protocol FilterViewModelProtocol {
    var routes: ((FilterRoutes) -> Void)? { get set }
    func dismissFilters()
    func recordFilterButtonTap(filterSection: CellWithFilterSelectionType, filterType: FilterCheckedButtonType, active: Bool)
    func filtersChecked(type: CellWithFilterSelectionType) -> [FilterCheckedButtonType]?
    func applyButtonTap()
    func viewChangesToTheFilterModel() -> Bool
    func clearFilters()
    func filterIsEmpty() -> Bool
}

enum FilterRoutes {
    case dismiss
    case applyFiltersArray([String])
}
final class FilterViewModel: FilterViewModelProtocol {
    var routes: ((FilterRoutes) -> Void)?

    private var originalFilterModel: Filters?
    private var filterModel: Filters
    private var filteredModel = [String]()

    init(filters: Filters) {
        filterModel = filters
        originalFilterModel = filters
    }

    func viewChangesToTheFilterModel() -> Bool {
        return filterModel != originalFilterModel
    }

    func filterIsEmpty() -> Bool {
        return filterModel.isEmpty()
    }

    func dismissFilters() {
        routes?(.dismiss)
    }
    func applyButtonTap() {
        routes?(.applyFiltersArray(filteredModel))
    }

    func recordFilterButtonTap(filterSection: CellWithFilterSelectionType, filterType: FilterCheckedButtonType, active: Bool) {
        switch filterSection {
        case .category:
            if active {
                if let categoryFilter = filterType.toCategoriesType() {
                    filteredModel.append(categoryFilter.rawValue)
                    print("26 .filteredModel \(filteredModel)")
                    //NOTE: Добавил rawValue of selected object
                }
            } else {
                //NOTE: Delete from array if button is deselected
                filteredModel.removeAll()
            }
        }
    }

    func filtersChecked(type: CellWithFilterSelectionType) -> [FilterCheckedButtonType]? {
        switch type {
        case .category:
            return [FilterCheckedButtonType]()
        }
    }

    func clearFilters() {
        filterModel.clear()
    }
}

extension FilterViewModel: ApplyFilterButtonViewDelegate {
    func buttonTap() {
        applyButtonTap()
    }
}
