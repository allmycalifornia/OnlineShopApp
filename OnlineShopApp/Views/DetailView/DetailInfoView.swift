
import SwiftUI

struct DetailInfoView: View {
    
    @EnvironmentObject var vm: ViewModel
    let product: Product
    @State private var isInCart = false // Состояние: продукт в корзине или нет
    
    let spacing: CGFloat = 12
    let hPadding: CGFloat = 20
    
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
            
            Text(product.description)
                .subTitle()
                .fixedSize(horizontal: false, vertical: true)
            
            Spacer()
            
            // Кнопки
            if isInCart {
                HStack(spacing: 12) {
                    // Кнопка "Убрать из корзины"
                    CustomMainButton(title: Helper.Buttons.RemoveFromCartButton) {
                        vm.removeFromCart(product: product)
                        isInCart = false
                    }
                    
                    // Кнопка "Перейти в корзину"
                    NavigationLink(destination: CartView()) {
                        Text(Helper.Buttons.GoToCartButton)
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                            .frame(maxWidth: .infinity)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            .padding()
                            .background(.black)
                            .clipShape(Capsule())
                            .shadow(color: .black.opacity(0.3), radius: 10, x: 5, y: 8)
                    }
                }
            } else {
                // Кнопка "Добавить в корзину"
                CustomMainButton(title: Helper.Buttons.AddToCartButton) {
                    vm.addToCart(product: product)
                    isInCart = true
                }
            }
        }
        .padding(.horizontal, hPadding)
    }
}
