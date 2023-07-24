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
    
    func start() -> UIViewController? {
        let viewModel = MockViewModel()
        let viewController = MockViewController(viewModel: viewModel)
        mockViewController = viewController
        let navController = CustomNavigationController(viewController)
        navController.customNavigationIsHiden = false
        navigationController = navController
        return navController
    }
}
