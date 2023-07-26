//
//  MockViewModel.swift
//  RXStore
//
//  Created by Мельник Дмитрий on 23.07.2023.
//

import UIKit


protocol MockViewModelProtocol: CardActionViewDelegate {
    func numberOfRowsInSection() -> Int
}

final class MockViewModel: MockViewModelProtocol {
    
    var cellCount = 4
    
    func numberOfRowsInSection() -> Int {
//        guard let cellCount = self.cellCount else {
//            return 0
//        }
        return cellCount
    }
}
extension MockViewModel: CardActionViewDelegate {
    func reloadButtonTap() {
        print("reloadButtonTap()")
    }
    
    func filterButtonTap() {
        print("filterButtonTap()")
    }
}
