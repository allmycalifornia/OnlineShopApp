//
//  ContentView.swift
//  OnlineShopApp
//
//  Created by Борис Кравченко on 09.12.2024.
//

import SwiftUI
import FirebaseFirestoreInternalWrapper
import FirebaseFirestore
import FirebaseFirestoreCombineSwift
import FirebaseFirestoreInternal

struct MainView: View {
    
    // MARK: - Properties
    @FirestoreQuery(collectionPath: "shop") var items: [Product]
    var columns = Array(repeating: GridItem(), count: 2)
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns) {
                    ForEach(items) { item in
                        Text(item.name)
                    }
                }
            }
            
            // MARK: - Navigation Bar
            .navigationTitle("Products")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink(destination: FavoritesView()) {
                        Image(systemName: "heart.fill")
                            .font(.title2)
                    }
                    .buttonStyle(.plain)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: CartView()) {
                        Image(systemName: "cart.fill")
                            .font(.title2)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

#Preview {
    MainView()
}
