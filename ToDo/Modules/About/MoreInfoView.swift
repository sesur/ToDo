import SwiftUI

struct MoreInfoView: View {
    
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("MoreInfoView screen")
                .padding()
            Button("Dismiss") {
               dismiss()
            }
        }
    }
}

#Preview {
    MoreInfoView()
}
