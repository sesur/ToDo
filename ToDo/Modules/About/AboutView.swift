import SwiftUI

struct AboutView: View {
    
    @State var isMoreInfoPresented = false
    
    var body: some View {
        VStack {
            Text("This app was made during\n a SwiftUI course 🧑‍🎓🧑‍🎓")
                .multilineTextAlignment(.center)
                .font(.headline)
                .padding()
            
            Button("More info") {
                isMoreInfoPresented = true
            }
        }
        .sheet(isPresented: $isMoreInfoPresented) {
            MoreInfoView()
                .presentationDetents([.large, .medium, .fraction(0.8), .fraction(0.2)])
        }
        
    }
}

#Preview {
    AboutView()
}
