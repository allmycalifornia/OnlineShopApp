
import SwiftUI

struct BackButtonView: View {
    
    @Environment(\.dismiss) var dismiss
    let circleSize: CGFloat = 34
    
    var body: some View {
        Button {
            dismiss()
        } label: {
            ZStack {
                Circle()
                    .frame(width: circleSize)
                    .foregroundStyle(.black)
                    .opacity(0.3)
                Image(systemName: Helper.Image.chevronLeft)
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundStyle(.white)
                    .opacity(0.8)
            }
        }
    }
}

#Preview {
    BackButtonView()
}
