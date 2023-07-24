//
//  MockViewModel.swift
//  RXStore
//
//  Created by Мельник Дмитрий on 23.07.2023.
//

import UIKit


protocol MockViewModelProtocol: CardActionViewDelegate {}

final class MockViewModel: MockViewModelProtocol {
    
}
extension MockViewModel: CardActionViewDelegate {
    func reloadButtonTap() {
        print("reloadButtonTap()")
    }
    
    func filterButtonTap() {
        print("filterButtonTap()")
    }
}
