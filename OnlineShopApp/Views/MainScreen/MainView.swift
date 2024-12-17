
import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreCombineSwift

struct MainView: View {
    
    // MARK: - Properties
    @EnvironmentObject var vm: ViewModel
    @FirestoreQuery(collectionPath: Helper.Firebase.shop) var items: [Product]
    var columns = Array(repeating: GridItem(), count: 2)
    let hPadding: CGFloat = 10
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns) {
                    ForEach(items) { item in
                        NavigationLink(destination: DetailView(product: item)) {
                            ProductCardView(product: item)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .padding(.horizontal, hPadding)
            .background(.secondary.opacity(0.3))
            .shadow(color: .black.opacity(0.2), radius: 8, x: 5, y: 8)
            
            // MARK: - Navigation Bar
            .navigationTitle(Helper.Title.titleProducts)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink(destination: FavoritesView()) {
                        FavoritesButton()
                    }
                    .buttonStyle(.plain)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: CartView()) {
                        CartButton(numberOfProducts: vm.cartItemCount)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

#Preview {
    MainView()
        .environmentObject(ViewModel())
}
