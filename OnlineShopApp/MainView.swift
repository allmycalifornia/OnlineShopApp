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
    @FirestoreQuery(collectionPath: "shop") var items: [Product]
    
    
    var body: some View {
        List {
            ForEach(items) { item in
                HStack {
                    Text(item.name)
                    Text("\(item.price)")
                }
            }
        }
    }
}

#Preview {
    MainView()
}
