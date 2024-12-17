
import SwiftUI

struct CardImageView: View {
    
    let url: URL
    let width: CGFloat
    let height: CGFloat
    let cornerRadius: CGFloat = 20
    
    var body: some View {
        
        AsyncImage(url: url) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(width: width, height: height)
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        } placeholder: {
            ProgressView()
                .frame(width: width, height: height)
        }
    }
}
