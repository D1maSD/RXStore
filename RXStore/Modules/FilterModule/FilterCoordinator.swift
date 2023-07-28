//
//  FilterCoordinator.swift
//  RXStore
//
//  Created by Мельник Дмитрий on 27.07.2023.
//

import UIKit
//import UseCases

enum PeopleGoControllerRoutes {
    case hideTabBar(Bool)
}

final class FilterCoordinator: Coordinator {
    typealias Routes = PeopleGoControllerRoutes
    var routes: ((PeopleGoControllerRoutes) -> Void)?

    private weak var navigationController: CustomNavigationController?
//    private weak var filterViewController: FilterViewControllerInputProtocol?
    private weak var filterViewController: FilterViewController?

    func start() -> UIViewController? {
//        let viewModel = PeopleGoViewModel()
//        bindPeopleGoViewModel(viewModel: viewModel)
//
//        let navController = CustomNavigationController(controller)
//        navController.customNavigationIsHiden = true
//        navigationController = navController
        return UIViewController()
    }

//    func handleTabbarTapAction() {
//        guard let count = navigationController?.viewControllers.count else { return }
//        if count > 1 {
//            peopleGoViewController?.moovedFromAnotherTab = false
//            navigationController?.jumpToTheDesiredController()
//            navigationController?.customNavigationIsHiden = true
//        } else {
//            peopleGoViewController?.returnToFirstCard()
//        }
//    }


    
    private func showFilterScreen(filters: Filters) {
        let viewModel = FilterViewModel(filters: filters)
        bindFilterViewModel(viewModel: viewModel)
//        let listManager = FilterListManager(city: filters.city, country: filters.country, dateFrom: filters.dateFrom, dateBefore: filters.dateBefore)
        let controller = FilterViewController(viewModel: viewModel)
        filterViewController = controller
        navigationController?.customNavigationIsHiden = false
        navigationController?.pushViewController(controller, animated: true, type: .white)
    }

    private func bindFilterViewModel(viewModel: FilterViewModel) {
        viewModel.routes = { [weak self] routes in
            switch routes {
            case .dismiss:
//                self?.peopleGoViewController?.moovedFromAnotherTab = false
                self?.navigationController?.popToViewController(animated: true)
                self?.navigationController?.customNavigationIsHiden = true
            case .applyFilters(let filterModel):
//                self?.peopleGoViewController?.moovedFromAnotherTab = false
//                self?.peopleGoViewController?.saveNewFilters(filters: filterModel)
                self?.navigationController?.popToViewController(animated: true)
                self?.navigationController?.customNavigationIsHiden = true
            case .chooseCountry:
                print("self?.showChooseCountry()") 
            }
        }
    }


    private func showProfile(userId: Int) {
        
    }

    private func showEvent(eventId: Int, categoryId: Int) {
        
    }
}

