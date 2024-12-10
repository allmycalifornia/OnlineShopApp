//
//  ViewModel.swift
//  OnlineShopApp
//
//  Created by Борис Кравченко on 10.12.2024.
//

import SwiftUI
import FirebaseFirestore

final class ViewModel: ObservableObject {
    
    // MARK: - Properties
    private let db = Firestore.firestore().collection("shop")
    
    // MARK: - Methods
    func toggleFavorite(product: Product) {
        guard let id = product.id else { return }
        db.document(id).updateData(["isFavorite": !product.isFavorite])
    }
    
}
