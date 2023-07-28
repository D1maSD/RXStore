//
//  MockViewModel.swift
//  RXStore
//
//  Created by Мельник Дмитрий on 23.07.2023.
//

import UIKit


protocol MockViewModelProtocol: CardActionViewDelegate {
    func numberOfRowsInSection() -> Int
    var delegate: MockViewModelDelegate? { get set }
    func loadData(completion: @escaping ([ProductPage]) -> Void)
    var sweetArray: [ProductPage] { get }
    var routes: ((MockRoutes) -> Void)? { get set }
}

protocol MockViewModelDelegate: AnyObject {
//    func loadingAnimation(start: Bool)
//    func emptyPlugView(show: Bool)
}

enum MockRoutes {
    case showFilterScreen(filters: Filters)
}

enum MockViewRoutes {
    case showFilterScreen(filters: Filters)
}

final class MockViewModel: MockViewModelProtocol {
    var delegate: MockViewModelDelegate?
    
    
    var cellCount = 4
    var routes: ((MockRoutes) -> Void)?
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
    
    func showFiltersScreen() {
        print("23 .showFiltersScreen")
//        routes?(.showFilterScreen(filters: filters))
    }
    
    func getCards(withPaging: Bool) {
//        guard !isLoading else { return }
//        if !noMoreEvents {
//            delegate?.loadingAnimation(start: true)
//            isLoading = true
//            loadCards(withPaging: withPaging) { [weak self] configurators in
//                guard let collectionManager = self?.collectionManager else { return }
//                collectionManager.update(isPaging: withPaging, configurators: configurators)
//                self?.noMoreEvents = configurators.isEmpty
//                self?.delegate?.emptyPlugView(show: collectionManager.configuratorsIsEmpty )
//                self?.delegate?.loadingAnimation(start: false)
//                self?.isLoading = false
//            }
//        }
    }
}
extension MockViewModel: CardActionViewDelegate {
    func reloadButtonTap() {
        getCards(withPaging: false)
    }
    
    func filterButtonTap() {
//        noMoreEvents = false
        showFiltersScreen()
    }
}

