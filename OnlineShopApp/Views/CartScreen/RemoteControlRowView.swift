
import SwiftUI

struct RemoteControlRowView: View {
    
    let product: Product
    @EnvironmentObject var vm: ViewModel
    let spacing: CGFloat = 25
    
    var body: some View {
        VStack(alignment: .trailing, spacing: spacing) {
            Button {
                vm.removeFromCart(product: product)
            } label: {
                Image(systemName: Helper.Image.xmark)
                    .font(.title2)
            }
            .buttonStyle(.plain)
            
            HStack {
                Button {
                    vm.decreaseQuantity(product: product)
                } label: {
                    Image(systemName: Helper.Image.minus)
                        .foregroundStyle(.primary)
                        .font(.title)
                }
                .buttonStyle(.plain)
                
                if let quantityInCart = product.quantityInCart {
                    Text("\(quantityInCart)")
                        .titleFont()
                }
                
                Button {
                    vm.increaseQuantity(product: product)
                } label: {
                    Image(systemName: Helper.Image.plus)
                        .foregroundStyle(.primary)
                        .font(.title)
                }
                .buttonStyle(.plain)
            }
        }
        .padding()
    }
}

