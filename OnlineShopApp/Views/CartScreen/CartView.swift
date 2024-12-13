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
    
    @FirestoreQuery(collectionPath: "shop") private var items: [Product]
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(items.filter { $0.quantityInCart ?? 0 > 0 }) { item in
                    ProductRow(product: item)
                }
            }

            Text("Total: ")
                .titleFont()
                .padding(.bottom)
            
            CustomMainButton(title: "Buy") {
                // action
            }
            .padding(30)
        }
        .navigationTitle("Cart")
        .background(.secondary.opacity(0.3))
    }
}

#Preview {
    CartView()
}
