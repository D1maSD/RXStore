//
//  MockViewModel.swift
//  RXStore
//
//  Created by Мельник Дмитрий on 23.07.2023.
//

import UIKit
import RxSwift


protocol MockViewModelProtocol: CardActionViewDelegate {
    func numberOfRowsInSection() -> Int
    var delegate: MockViewModelDelegate? { get set }
//    func loadData(categoryTitle: String, completion: @escaping ([ProductPage]) -> Void)
    func loadData(categoryTitle: String) -> Observable<[ProductPage]>
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
    private let disposeBag = DisposeBag()
    private var cellCount = 4
    var routes: ((MockRoutes) -> Void)?
    var sweetArray = [ProductPage]()
    let firestoreManager = FirestoreManager()
    
    private lazy var filters: Filters = Filters(city: "peopleGoUseCase.selectedCity", country: "peopleGoUseCase.selectedCountry", showAllCities: false)
    
    func numberOfRowsInSection() -> Int {
        return cellCount
    }
    
    func loadData(categoryTitle: String) -> Observable<[ProductPage]> {
        return Observable.create { [weak self] observer in
            var collection = "Gu4T2fxnPDUoyM1JT4nd"
            if !categoryTitle.isEmpty {
                collection = categoryTitle
            }
            
            self?.firestoreManager.db.collection("productPage").document(collection).getDocument() { [weak self] documentSnapshot, error in
                if let error = error {
                    observer.onError(error)
                } else {
                    if let documentData = documentSnapshot?.data() {
                        let productPage = ProductPage(dictionary: documentData)
                        if let productPage = productPage {
                            observer.onNext([productPage])
                            observer.onCompleted()
                        } else {
                            observer.onNext([])
                            observer.onCompleted()
                        }
                    } else {
                        observer.onNext([])
                        observer.onCompleted()
                    }
                }
            }
            
            return Disposables.create()
        }
    }
    
    func showFiltersScreen() {
        routes?(.showFilterScreen(filters: filters))
    }
}
extension MockViewModel: CardActionViewDelegate {
    func reloadButtonTap() {
    }
    
    func filterButtonTap() {
        showFiltersScreen()
    }
}
