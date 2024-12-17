
import SwiftUI

struct ProductRow: View {
    
    let product: Product
    let imageSize: CGFloat = 100
    let spacing: CGFloat = 20
    let padding: CGFloat = 10
    let cornerRadius: CGFloat = 20
    
    var body: some View {
        ZStack(alignment: .trailing) {
            HStack(spacing: spacing) {
                
                // MARK: Image
                if let url = URL(string: product.image) {
                    CardImageView(url: url, width: imageSize, height: imageSize)
                }
                
                // MARK: Info
                VStack(alignment: .leading, spacing: spacing) {
                    Text(product.name)
                        .font(.headline)
                        .lineLimit(2)
                    
                    if let quantity = product.quantityInCart {
                        let sum = quantity * product.price
                        Text("$\(sum)")
                            .font(.subheadline)
                            .lineLimit(3)
                    }
                    
                }
                
                Spacer()
            }
            .padding(padding)
            .background(.background)
            .cornerRadius(cornerRadius)
            
            RemoteControlRowView(product: product)
            
        }
        .shadow(color: .black.opacity(0.1), radius: 7, x: 5, y: 6)
        .padding(.horizontal, padding)
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
