//
//  Product.swift
//  OnlineShopApp
//
//  Created by Борис Кравченко on 09.12.2024.
//

import Foundation
import FirebaseFirestoreInternalWrapper
import FirebaseFirestore
import FirebaseFirestoreCombineSwift
import FirebaseFirestoreInternal

struct Product: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String
    var description: String
    var image: String
    var price: Int
    var isFavorite: Bool
    var quantityInCart: Int?
}
