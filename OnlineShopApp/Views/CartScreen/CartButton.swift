
import SwiftUI

struct CartButton: View {
    
    var numberOfProducts: Int
    let badgeSize: CGFloat = 17
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: Helper.Image.cart)
                .font(.title2)
                .padding(.top, 5)
            
            if numberOfProducts > 0 {
                Text("\(numberOfProducts)")
                    .font(.caption).bold()
                    .foregroundStyle(.white)
                    .frame(width: badgeSize, height: badgeSize)
                    .background(.red)
                    .clipShape(Circle())
            }
        }
    }
}

#Preview {
    CartButton(numberOfProducts: 5)
}
