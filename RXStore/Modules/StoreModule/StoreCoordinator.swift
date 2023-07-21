//
//  StoreCoordinator.swift
//  RXStore
//
//  Created by Мельник Дмитрий on 20.07.2023.
//

import UIKit


final class StoreCoordinator: Coordinator {
    
    private weak var storeViewController: StoreViewController?
    private weak var navigationController: CustomNavigationController?
    
    func start() -> UIViewController? {
        let viewModel = StoreViewModel()
        let viewController = StoreViewController(viewModel: viewModel)
        storeViewController = viewController
        let navController = CustomNavigationController(viewController)
        navController.customNavigationIsHiden = true
        navigationController = navController
        return navController
    }
    
//    typealias Routes = <#type#>
}
