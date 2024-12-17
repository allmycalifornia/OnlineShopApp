
import SwiftUI

struct FavoritesButton: View {
    var body: some View {
        Image(systemName: Helper.Image.heart)
            .font(.title2)
    }
}

#Preview {
    FavoritesButton()
}
