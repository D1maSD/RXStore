//
//  MockCoordinator.swift
//  RXStore
//
//  Created by Мельник Дмитрий on 23.07.2023.
//

import UIKit

final class MockCoordinator: Coordinator {
    
    private weak var mockViewController: MockViewController?
    private weak var navigationController: CustomNavigationController?
    private weak var filterViewController: FilterViewController?
    
    func start() -> UIViewController? {
        let viewModel = MockViewModel()
        bindMockViewModel(viewModel: viewModel)
        let viewController = MockViewController(viewModel: viewModel)
        mockViewController = viewController
        let navController = CustomNavigationController(viewController)
        navController.customNavigationIsHiden = true
        navigationController = navController
        return navController
    }
    
    private func showFilterScreen(filters: Filters) {
        let viewModel = FilterViewModel(filters: filters)
        bindFilterViewModel(viewModel: viewModel)
//        let listManager = FilterListManager(city: filters.city, country: filters.country, dateFrom: filters.dateFrom, dateBefore: filters.dateBefore)
        let controller = FilterViewController(viewModel: viewModel)
        filterViewController = controller
        navigationController?.customNavigationIsHiden = false
        navigationController?.pushViewController(controller, animated: true, type: .clear)
    }
    
    private func bindFilterViewModel(viewModel: FilterViewModel) {
        viewModel.routes = { [weak self] routes in
            switch routes {
            case .dismiss:
//                self?.peopleGoViewController?.moovedFromAnotherTab = false
                self?.navigationController?.popToViewController(animated: true)
                self?.navigationController?.customNavigationIsHiden = true
            case .applyFilters(let filterModel):
                print("bindFilterViewModel MockCoordinator")
//                self?.mockViewController?.moovedFromAnotherTab = false
                self?.mockViewController?.saveNewFilters(filters: filterModel)
                self?.navigationController?.popToViewController(animated: true)
                self?.navigationController?.customNavigationIsHiden = true
            case .chooseCountry: break
//                self?.showChooseCountry()
            case .applyFiltersArray(let filterModel):
                print("27 .filterModel \(filterModel)")
//                self?.mockViewController?.moovedFromAnotherTab = false
                self?.mockViewController?.saveNewFiltersArray(filters: filterModel)
                self?.navigationController?.popToViewController(animated: true)
                self?.navigationController?.customNavigationIsHiden = true
            }
        }
    }
    
    
    private func bindMockViewModel(viewModel: MockViewModel) {
        viewModel.routes = { [weak self] routes in
            switch routes {
            case .showFilterScreen(filters: let filters):
                self?.showFilterScreen(filters: filters)
//            case .showEvent(eventId: let eventId, categoryId: let categoryId):
//                self?.showEvent(eventId: eventId, categoryId: categoryId)
//            case .showProfile(let userId):
//                self?.showProfile(userId: userId)
            }
        }
    }
}
