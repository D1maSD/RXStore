//
//  Coordinator.swift
//  RXStore
//
//  Created by Мельник Дмитрий on 20.07.2023.
//

import UIKit


protocol Coordinator {
//    associatedtype Routes

    // MARK: Required methods

//    var routes: ((Routes) -> Void)? { get set }
    func start() -> UIViewController?

    // MARK: Optional methods

    func openLink(url: URL)
}

extension Coordinator {
    func openLink(url: URL) {
        UIApplication.shared.open(url)
    }
}
