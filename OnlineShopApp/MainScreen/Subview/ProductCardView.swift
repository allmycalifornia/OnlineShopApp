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
            
            ZStack(alignment: .bottom) {
                ZStack(alignment: .topTrailing) {
                    if let url = URL(string: product.image) {
                        CardImageView(url: url, width: size.width, height: size.height)
                        
                        Button {
                            // action
                        } label: {
                            Image(systemName: "heart.fill")
                                .padding(10)
                                .foregroundColor(product.isFavorite ? .red : .white)
                                .background(.black)
                                .clipShape(Circle())
                                .padding()
                        }
                        
                    }
                }
                
                VStack {
                    Text(product.name)
                        .titleFont()
                        .lineLimit(1)
                    Text("$\(product.price)")
                        .subTitle()
                }
                .padding(10)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.background.opacity(0.5))
                .cornerRadius(10)
                .padding(10)
            }
        }
        .frame(height: UIScreen.main.bounds.width * 0.7)
    }
}

//#Preview {
//    ProductCardView(
//        product: Product(
//            name: "DD",
//            description: "DD",
//            image: "https://cloud.mail.ru/public/UTx3/V5t71Af6N",
//            price: 42,
//            isFavorite: false
//        )
//    )
//}

#Preview {
    MainView()
}
