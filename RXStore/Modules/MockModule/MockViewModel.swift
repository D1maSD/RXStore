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
    func loadData(categoryTitle: String, completion: @escaping ([ProductPage]) -> Void)
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
    
    private lazy var filters: Filters = Filters(city: "peopleGoUseCase.selectedCity", country: "peopleGoUseCase.selectedCountry", showAllCities: false)
    
    func numberOfRowsInSection() -> Int {
//        guard let cellCount = self.cellCount else {
//            return 0
//        }
        return cellCount
    }
    
    func loadData(categoryTitle: String, completion: @escaping ([ProductPage]) -> Void) {
        var collection = "Gu4T2fxnPDUoyM1JT4nd"
        if !categoryTitle.isEmpty {
            collection = categoryTitle
        }
//        "tShort"
//        let store = firestoreManager.db.collection(collection).document("T-shirt")
//        store.lazy.flatMap({ProductPage(dictionary: $0.data())})
//        print("22 .Store \(store)")
        
        
//        firestoreManager.db.collection(collection).getDocuments() { [weak self] querySnapshot, error in
//            if let error = error {
//                print("22 .\(error.localizedDescription)")
//            } else {
//                print("print(22 .\(querySnapshot!.documents))")
//                self?.sweetArray = querySnapshot!.documents.flatMap({ProductPage(dictionary: $0.data())})
//                let array = querySnapshot!.documents.flatMap({ProductPage(dictionary: $0.data())})
////                print("print(22 .\(array))")
//                print("print(22 array.\(array))")
//                print("print(22 self?.sweetArray.\(self?.sweetArray))")
//                completion(array)
////                print("22 .self.sweetArray \(self.sweetArray[0]) count: \(self.sweetArray.count)")
//                DispatchQueue.main.async {
////                    self.tableView.reloadData()
//                }
//            }
//        }
        
        
        firestoreManager.db.collection("productPage").document(collection).getDocument() { [weak self] documentSnapshot, error in
                if let error = error {
                    print("22 .\(error.localizedDescription)")
                } else {
                    if let documentData = documentSnapshot?.data() {
                        let productPage = ProductPage(dictionary: documentData)
                        if let productPage = productPage {
                            completion([productPage])
                        } else {
                            completion([])
                        }
                    } else {
                        completion([])
                    }
                }
            }

    }
    
    func showFiltersScreen() {
        print("23 .showFiltersScreen")
        routes?(.showFilterScreen(filters: filters))
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

