//
//  MockModel.swift
//  RXStore
//
//  Created by Мельник Дмитрий on 23.07.2023.
//

import Foundation
import FirebaseFirestore

protocol DocumentSerializable  {
    init?(dictionary:[String:Any])
}


struct ProductPage {

    var allRates: String
    var articleNumber: String
    var brandName: String
    var color: String
    var descriptionOfProduct: String
    var oldPrice: String
    var price: String
    var productPhotos: [String]
    var rate: String
    var sameProducts: String
    var numberOfPurchases: String
    var detailedDescriptionOfProduct: String
    var otherColors: [String]
    
    var dictionary:[String:Any] {
        return [
            "allRates" : allRates,
            "articleNumber" : articleNumber,
            "brandName" : brandName,
            "color" : color,
            "descriptionOfProduct" : descriptionOfProduct,
            "oldPrice" : oldPrice,
            "price" : price,
            "productPhotos" : productPhotos,
            "rate" : rate,
            "sameProducts" : sameProducts,
            "numberOfPurchases" : numberOfPurchases,
            "detailedDescriptionOfProduct": detailedDescriptionOfProduct,
            "otherColors": otherColors
        ]
    }
    
}

extension ProductPage : DocumentSerializable {
    init?(dictionary: [String : Any]) {
        
        guard let  allRates = dictionary["allRates"] as? String else {
            print("30 .allRates nil")
            return nil}
        print("31 .allRates \(allRates)")
        guard let articleNumber = dictionary["articleNumber"] as? String else {
                print("30 .articleNumber nil")
                return nil}
        guard let brandName = dictionary["brandName"] as? String else {
                print("30 .brandName nil")
                return nil}
        guard let color = dictionary["color"] as? String else {
                print("30 .color nil")
                return nil}
        guard let descriptionOfProduct = dictionary["descriptionOfProduct"] as? String else {
                print("30 .descriptionOfProduct nil")
                return nil}
        guard let oldPrice = dictionary["oldPrice"] as? String else {
                print("30 .oldPrice nil")
                return nil}
        guard let price = dictionary["price"] as? String else {
            print("30 .price nil")
            return nil}
        guard let rate = dictionary["rate"] as? String else {
                print("30 .rate nil")
                return nil}
        guard let sameProducts = dictionary["sameProducts"] as? String else {
                print("30 .sameProducts nil")
                return nil}
        guard let numberOfPurchases = dictionary["numberOfPurchases"] as? String else {
                print("30 .numberOfPurchases nil")
                return nil}
        print("31 .numberOfPurchases \(numberOfPurchases)")
        guard let detailedDescriptionOfProduct = dictionary["detailedDescriptionOfProduct"] as? String else {
                print("30 .detailedDescriptionOfProduct nil")
                return nil}
        guard let otherColors = dictionary["otherColors"] as? [String] else {
            print("30 .otherColors nil")
            return nil}
        guard let productPhotos = dictionary["productPhotos"] as? [String] else {
                print("30 .productPhotos nil")
                return nil}
            
        self.init(
            allRates: allRates,
            articleNumber: articleNumber,
            brandName: brandName,
            color: color,
            descriptionOfProduct: descriptionOfProduct,
            oldPrice: oldPrice,
            price: price,
            productPhotos: productPhotos,
            rate: rate,
            sameProducts: sameProducts,
            numberOfPurchases: numberOfPurchases,
            detailedDescriptionOfProduct: detailedDescriptionOfProduct,
            otherColors: otherColors
        )
//        self.init(name: name, content: content, timeStamp: timeStamp)
    }
}
