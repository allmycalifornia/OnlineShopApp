
import SwiftUI

struct ProductCardView: View {
    
    @EnvironmentObject var vm: ViewModel
    let product: Product
    let padding: CGFloat = 10
    let cornerRadius: CGFloat = 10
    
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            
            ZStack(alignment: .bottom) {
                ZStack(alignment: .topTrailing) {
                    if let url = URL(string: product.image) {
                        CardImageView(url: url, width: size.width, height: size.height)
                        
                        Button {
                            vm.toggleFavorite(product: product)
                        } label: {
                            Image(systemName: Helper.Image.heart)
                                .padding(padding)
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
                .padding(padding)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.background.opacity(0.5))
                .cornerRadius(cornerRadius)
                .padding(padding)
            }
        }
        .frame(height: UIScreen.main.bounds.width * 0.7)
    }
}

#Preview {
    MainView()
        .environmentObject(ViewModel())
}
