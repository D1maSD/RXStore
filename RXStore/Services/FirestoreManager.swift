//
//  FirestoreManager.swift
//  RXStore
//
//  Created by Мельник Дмитрий on 25.07.2023.
//

import FirebaseFirestore


struct FirestoreManager {
    
    static let db = Firestore.firestore()
    static let envirement = "productPage"
    static let root = db.collection(envirement).document("Gu4T2fxnPDUoyM1JT4nd")
    
}
