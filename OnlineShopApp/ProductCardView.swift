//
//  ProductCardView.swift
//  OnlineShopApp
//
//  Created by Борис Кравченко on 10.12.2024.
//

import SwiftUI

struct ProductCardView: View {
    
    let product: Product
    
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            
            if let url = URL(string: product.image) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: size.width, height: size.height)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                } placeholder: {
                    ProgressView()
                }
            }
            
            
        }
        .frame(height: UIScreen.main.bounds.width * 0.7)
        .background(.green)
    }
}

#Preview {
    ProductCardView(
        product: Product(
            name: "DD",
            description: "DD",
            image: "https://cloud.mail.ru/public/UTx3/V5t71Af6N",
            price: 42,
            isFavorite: false
        )
    )
}
