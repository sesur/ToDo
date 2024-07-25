import SwiftUI

struct ToggleButton: View {
    
    @Binding var state: Bool
    
    var body: some View {
        Button {
            withAnimation {
                state.toggle()
            }
        } label: {
            GeometryReader { proxy in
                ZStack {
                    Circle()
                        .stroke(lineWidth: 2.0)
                    
                    if state {
                        Circle()
                            .frame(width: proxy.size.width * 0.8)
                    }
                }
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
        }
        .scaledToFit()
        .buttonStyle(.borderless)
    }
}

struct ToggleButton_Previews: PreviewProvider {
    
    private static let layout: PreviewLayout = .fixed(width: 100, height: 100)
    
    static var previews: some View {
        StatefulPreviewWrapper(false) { state in
            ToggleButton(state: state)
                .previewLayout(layout)
        }
    }
}
