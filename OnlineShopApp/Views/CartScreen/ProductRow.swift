//
//  ProductRow.swift
//  OnlineShopApp
//
//  Created by Борис Кравченко on 13.12.2024.
//

import SwiftUI

struct ProductRow: View {
    
    let product: Product
    
    var body: some View {
        ZStack(alignment: .trailing) {
            HStack(spacing: 20) {
                
                // MARK: Image
                if let url = URL(string: product.image) {
                    CardImageView(url: url, width: 100, height: 100)
                }
                
                // MARK: Info
                VStack(alignment: .leading, spacing: 20) {
                    Text(product.name)
                        .font(.headline)
                        .lineLimit(2)
                    
                    Text("$\(product.price)")
                        .font(.subheadline)
                        .lineLimit(3)
                }
                
                Spacer()
            }
            .padding(10)
            .background(.background)
            .cornerRadius(20)
            
            RemoteControlRowView(product: product)
            
        }
        .shadow(color: .black.opacity(0.1), radius: 7, x: 5, y: 6)
        .padding(.horizontal, 10)
        .background(.secondary.opacity(0.3))
    }
}

#Preview {
    ProductRow(
            product: Product(
            name: "Apple Watch",
            description: "iPhone 16 Pro takes video capture to a whole new level with 4K 120 fps Dolby Vision — our highest resolution and frame rate combo yet. Enabled by the new 48MP Fusion camera with second-generation quad-pixel sensor and our powerful A18 Pro chip, iPhone 16 Pro lets you record 4K 120 fps Dolby Vision in video mode or slo-mo.",
            image: "https://img.freepik.com/free-photo/modern-stationary-collection-arrangement_23-2149309642.jpg?uid=R47085111&semt=ais_hybrid",
            price: 123,
            isFavorite: false
        )
    )
}
