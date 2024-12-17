
import SwiftUI

struct DetailInfoView: View {
    
    @EnvironmentObject var vm: ViewModel
    let product: Product
    let spacing: CGFloat = 20
    let hPadding: CGFloat = 30
    
    var body: some View {
        VStack(alignment: .leading, spacing: spacing) {
            HStack {
                Text(product.name)
                    .titleFont()
                Spacer()
                Text("$\(product.price)")
                    .titleFont()
            }
            .padding(.bottom, 5)
            
            ScrollView(.vertical, showsIndicators: false) {
                Text(product.description)
                    .subTitle()
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            Spacer()
            
            CustomMainButton(title: Helper.Buttons.AddToCartButton) {
                vm.addToCart(product: product)
            }
        }
        .padding(.horizontal, hPadding)
    }
}
