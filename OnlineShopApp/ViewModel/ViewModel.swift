
import SwiftUI
import FirebaseFirestore

final class ViewModel: ObservableObject {
    
    // MARK: - Properties
    private let db = Firestore.firestore().collection(Helper.Firebase.shop)
    @Published var cartItems: [Product] = []
    
    var cartItemCount: Int {
        cartItems.filter { $0.quantityInCart ?? 0 > 0 }.count
    }
    
    var totalPrice: Int {
        cartItems.reduce(0) { $0 + ($1.price * ($1.quantityInCart ?? 0)) }
    }
    
    init() {
        fetchItems()
    }
    
    // MARK: - Methods
    private func updateItem(product: Product, data: [String: Any]) {
        guard let id = product.id else { return }
        db.document(id).updateData(data)
    }
    
    private func fetchItems() {
        db.addSnapshotListener { snapshot, error in
            guard let documents = snapshot?.documents else { return }
            self.cartItems = documents.compactMap { document -> Product? in
                try? document.data(as: Product.self)
            }
        }
    }
    
    func toggleFavorite(product: Product) {
        updateItem(product: product, data: [Helper.Firebase.isFavorite: !product.isFavorite])
    }
    
    func addToCart(product: Product) {
        updateItem(product: product, data: [Helper.Firebase.quantityInCart: 1])
    }
 
    func removeFromCart(product: Product) {
        updateItem(product: product, data: [Helper.Firebase.quantityInCart: 0])
    }
    
    func increaseQuantity(product: Product) {
        let newQuantity = (product.quantityInCart ?? 0) + 1
        updateItem(product: product, data: [Helper.Firebase.quantityInCart: newQuantity])
    }
    
    func decreaseQuantity(product: Product) {
        let currentQuantity = product.quantityInCart ?? 0
        let newQuantity = max(currentQuantity - 1, 1)
        updateItem(product: product, data: [Helper.Firebase.quantityInCart: newQuantity])
    }
}
