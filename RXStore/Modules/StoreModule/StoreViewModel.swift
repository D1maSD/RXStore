//
//  StoreViewModel.swift
//  RXStore
//
//  Created by Мельник Дмитрий on 18.07.2023.
//

import UIKit


protocol StoreViewModelProtocol: CardActionViewDelegate {}

final class StoreViewModel: StoreViewModelProtocol {
    
}
extension StoreViewModel: CardActionViewDelegate {
    func reloadButtonTap() {
        print("reloadButtonTap()")
    }
    
    func filterButtonTap() {
        print("filterButtonTap()")
    }
}
