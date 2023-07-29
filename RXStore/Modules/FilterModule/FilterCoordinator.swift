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

    private func showProfile(userId: Int) {
        
    }

    private func showEvent(eventId: Int, categoryId: Int) {
        
    }
}

