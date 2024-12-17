
import Foundation
import FirebaseFirestore
import FirebaseFirestoreCombineSwift

struct Product: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String
    var description: String
    var image: String
    var price: Int
    var isFavorite: Bool
    var quantityInCart: Int?
}
