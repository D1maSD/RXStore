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
    var categorysHaveTravels: Bool? { get }
    func dismissFilters()
//    var delegate: ApplyFilterButtonViewDelegate? { get set }
    func recordFilterButtonTap(filterSection: CellWithFilterSelectionType, filterType: FilterCheckedButtonType, active: Bool)
    func filtersChecked(type: CellWithFilterSelectionType) -> [FilterCheckedButtonType]?
    func applyButtonTap()
    func viewChangesToTheFilterModel() -> Bool
    func clearFilters()
    func filterIsEmpty() -> Bool
    func updateShowInAllCities()
}

enum FilterRoutes {
    case dismiss
    case chooseCountry
    case applyFilters(Filters)
    case applyFiltersArray([String])
}
//filteredModel = [String]()
final class FilterViewModel: FilterViewModelProtocol {
    var routes: ((FilterRoutes) -> Void)?
    
    var categorysHaveTravels: Bool? {
//        filterModel.category?.contains(.travels)
        return false
    }

    private var originalFilterModel: Filters?
    private var filterModel: Filters
    private var filteredModel = [String]()

    init(filters: Filters) {
        filterModel = filters
        originalFilterModel = filters
    }

    func updateShowInAllCities() {
//        filterModel.showAllCities = !filterModel.showAllCities
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
    //NOTE: Here we tap filterApply
    func applyButtonTap() {
        routes?(.applyFilters(filterModel))
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
                    
//                    guard !(filterModel.category?.contains(categoryFilter) ?? false) else { return }
//                    filterModel.category?.append(categoryFilter)
                }
            } else {
                //NOTE: Delete from array if button is deselected
                filteredModel.removeAll()
                print("26 .filteredModel \(filteredModel)")
                if filterType == .first {
//                    filterModel.showAllCities = false
                }
//                filterModel.category?.removeAll { value in
//                    return value == filterType.toCategoriesType()
//                }
            }
        case .gender: break
            
        case .age: break
        }
    }

    func filtersChecked(type: CellWithFilterSelectionType) -> [FilterCheckedButtonType]? {
        switch type {
        case .category:
//            return filterModel.category?.compactMap { FilterCheckedButtonType(category: $0) }
            return [FilterCheckedButtonType]()
        case .gender:
            return [FilterCheckedButtonType]()
        case .age:
            return [FilterCheckedButtonType]()
        }
    }

    func clearFilters() {
        filterModel.clear()
    }
}

extension FilterViewModel: ApplyFilterButtonViewDelegate {
    func buttonTap() {
        print("24 .applyButtonTap")
        applyButtonTap()
    }
}
