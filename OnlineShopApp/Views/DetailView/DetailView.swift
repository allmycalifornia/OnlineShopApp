
import SwiftUI

struct DetailView: View {
    
    @EnvironmentObject var vm: ViewModel
    let product: Product
    let imageHeight = UIScreen.main.bounds.height / 1.7
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack(spacing: 0) {
                if let url = URL(string: product.image) {
                    CardImageView(url: url, width: UIScreen.main.bounds.width, height: imageHeight)
                        .ignoresSafeArea()
                        .shadow(color: .black.opacity(0.3), radius: 10, x: 5, y: 8)
                        .padding(.bottom, -70)
                }
                DetailInfoView(product: product)
            }
            .background(.secondary.opacity(0.3))
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: CartView()) {
                        CartButton(numberOfProducts: vm.cartItemCount)
                    }
                    .buttonStyle(.plain)
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink(destination: MainView()) {
                        BackButtonView()
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

#Preview {
    DetailView(
        product: Product(
            name: "Apple Watch",
            description: "iPhone 16 Pro takes video capture to a whole new level with 4K 120 fps Dolby Vision — our highest resolution and frame rate combo yet. Enabled by the new 48MP Fusion camera with second-generation quad-pixel sensor and our powerful A18 Pro chip, iPhone 16 Pro lets you record 4K 120 fps Dolby Vision in video mode or slo-mo.",
            image: "https://img.freepik.com/free-photo/modern-stationary-collection-arrangement_23-2149309642.jpg?uid=R47085111&semt=ais_hybrid",
            price: 123,
            isFavorite: false
        )
    )
    .environmentObject(ViewModel())
}
