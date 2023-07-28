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
}

final class FilterViewModel: FilterViewModelProtocol {
    var routes: ((FilterRoutes) -> Void)?
    
    var categorysHaveTravels: Bool? {
//        filterModel.category?.contains(.travels)
        return false
    }

    private var originalFilterModel: Filters?
    private var filterModel: Filters

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

    func applyButtonTap() {
        routes?(.applyFilters(filterModel))
    }

    func recordFilterButtonTap(filterSection: CellWithFilterSelectionType, filterType: FilterCheckedButtonType, active: Bool) {
        switch filterSection {
        case .category:
            if active {
                if let categoryFilter = filterType.toCategoriesType() {
//                    guard !(filterModel.category?.contains(categoryFilter) ?? false) else { return }
//                    filterModel.category?.append(categoryFilter)
                }
            } else {
                if filterType == .first {
//                    filterModel.showAllCities = false
                }
//                filterModel.category?.removeAll { value in
//                    return value == filterType.toCategoriesType()
//                }
            }
        case .gender: break
//            if active {
//                if let genderFilter = filterType.toGenderType() {
//                    guard !(filterModel.gender?.contains(genderFilter) ?? false) else { return }
//                    filterModel.gender?.append(genderFilter)
//                }
//            } else {
//                filterModel.gender?.removeAll { value in
//                    return value == filterType.toGenderType()
//                }
//            }
        case .age: break
//            if active {
//                if let ageFilter = filterType.toAgeType() {
//                    guard !(filterModel.ageGroup?.contains(ageFilter) ?? false) else { return }
//                    filterModel.ageGroup?.append(ageFilter)
//                }
//            } else {
//                filterModel.ageGroup?.removeAll { value in
//                    return value == filterType.toAgeType()
//                }
//            }
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
