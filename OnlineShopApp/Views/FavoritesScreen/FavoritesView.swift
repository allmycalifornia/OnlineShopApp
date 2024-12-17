
import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreCombineSwift

struct FavoritesView: View {
    
    @FirestoreQuery(collectionPath: Helper.Firebase.shop, predicates: [.isEqualTo(Helper.Firebase.isFavorite, true)]) private var favoritesItems: [Product]
    var columns = Array(repeating: GridItem(), count: 2)
    let hPadding: CGFloat = 10
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns) {
                ForEach(favoritesItems) { item in
                    NavigationLink(destination: DetailView(product: item)) {
                        ProductCardView(product: item)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .padding(.horizontal, hPadding)
        .background(.secondary.opacity(0.3))
        .navigationTitle(Helper.Title.titleFavorites)
    }
}

#Preview {
    FavoritesView()
}
