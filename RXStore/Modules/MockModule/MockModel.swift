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
        
        guard let  allRates = dictionary["allRates"] as? String,
        let articleNumber = dictionary["articleNumber"] as? String,
        let brandName = dictionary["brandName"] as? String,
        let color = dictionary["color"] as? String,
        let descriptionOfProduct = dictionary["descriptionOfProduct"] as? String,
        let oldPrice = dictionary["oldPrice"] as? String,
        let price = dictionary["price"] as? String,
        let rate = dictionary["rate"] as? String,
        let sameProducts = dictionary["sameProducts"] as? String,
        let numberOfPurchases = dictionary["numberOfPurchases"] as? String,
        let detailedDescriptionOfProduct = dictionary["detailedDescriptionOfProduct"] as? String,
        let otherColors = dictionary["otherColors"] as? [String],
        let productPhotos = dictionary["productPhotos"] as? [String] else {return nil}
            
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
    }
}
