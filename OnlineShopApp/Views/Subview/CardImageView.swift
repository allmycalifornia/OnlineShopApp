//
//  CardImageView.swift
//  OnlineShopApp
//
//  Created by Борис Кравченко on 10.12.2024.
//

import SwiftUI

struct CardImageView: View {
    
    let url: URL
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        
        AsyncImage(url: url) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(width: width, height: height)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        } placeholder: {
            ProgressView()
                .frame(width: width, height: height)
        }
    }
}
