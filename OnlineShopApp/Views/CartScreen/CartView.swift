//
//  CartView.swift
//  OnlineShopApp
//
//  Created by Борис Кравченко on 10.12.2024.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreCombineSwift

struct CartView: View {
    
    let products: [Product] = []
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                
            }
        }
        .navigationTitle("Cart")
    }
}

#Preview {
    CartView()
}
