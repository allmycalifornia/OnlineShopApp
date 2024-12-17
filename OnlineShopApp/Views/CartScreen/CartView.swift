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
    
    @EnvironmentObject var vm: ViewModel
    @FirestoreQuery(collectionPath: Helper.Firebase.shop) private var items: [Product]
    let hPadding: CGFloat = 30
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(items.filter { $0.quantityInCart ?? 0 > 0 }) { item in
                    ProductRow(product: item)
                }
            }

            Text("Total: \(vm.totalPrice) USD")
                .titleFont()
                .padding(.bottom)
            
            CustomMainButton(title: Helper.Buttons.buyButton) {
                // action
            }
            .padding(.horizontal, hPadding)
        }
        .navigationTitle(Helper.Title.titleCart)
        .background(.secondary.opacity(0.3))
    }
}

#Preview {
    CartView()
        .environmentObject(ViewModel())
}
