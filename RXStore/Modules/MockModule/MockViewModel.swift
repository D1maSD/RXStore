//
//  MockViewModel.swift
//  RXStore
//
//  Created by Мельник Дмитрий on 23.07.2023.
//

import UIKit


protocol MockViewModelProtocol: CardActionViewDelegate {
    func numberOfRowsInSection() -> Int
    func loadData(completion: @escaping ([ProductPage]) -> Void)
    var sweetArray: [ProductPage] { get }
}

final class MockViewModel: MockViewModelProtocol {
    
    var cellCount = 4
    
    var sweetArray = [ProductPage]()
    let firestoreManager = FirestoreManager()
    
    func numberOfRowsInSection() -> Int {
//        guard let cellCount = self.cellCount else {
//            return 0
//        }
        return cellCount
    }
    
    func loadData(completion: @escaping ([ProductPage]) -> Void) {
        firestoreManager.db.collection("productPage").getDocuments() { [weak self] querySnapshot, error in
            if let error = error {
                print("22 .\(error.localizedDescription)")
            } else {
                self?.sweetArray = querySnapshot!.documents.flatMap({ProductPage(dictionary: $0.data())})
                let array = querySnapshot!.documents.flatMap({ProductPage(dictionary: $0.data())})
                completion(array)
//                print("22 .self.sweetArray \(self.sweetArray[0]) count: \(self.sweetArray.count)")
                DispatchQueue.main.async {
//                    self.tableView.reloadData()
                }
            }
            
        }
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
