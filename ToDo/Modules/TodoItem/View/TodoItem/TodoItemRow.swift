import SwiftUI

struct TodoItemRow: View {
    
    @Binding var item: TodoItem
    private let buttonSize: CGFloat = 25
    
    var body: some View {
        HStack {
            ToggleButton(state: $item.isDone)
                .frame(width: buttonSize, height: buttonSize)
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.headline)
                    .strikethrough(item.isDone)
                
                if let description = item.description {
                    Text(description)
                        .font(.subheadline)
                        .strikethrough(item.isDone)
                }
            }
            .padding(.leading)
            Spacer()
        }
        .padding()
    }
}

struct TodoItemRow_Previews: PreviewProvider {
    
    private enum RowKey {
        static let bredTitle = "Buy some bred 🥖"
        static let milkTitle = "Buy some milk 🥛"
        static let description = "Get lactoze for free"
        static let basicItem = "Basic item"
        static let descriptionItem = "Description item"
        static let previewLayout: PreviewLayout = .fixed(width: 300, height: 70)
    }
    
    static let basicItem = TodoItem(id: UUID(),
                                    title: RowKey.bredTitle,
                                    isDone: true)
    static let item = TodoItem(id: UUID(),
                               title: RowKey.milkTitle,
                               description: RowKey.description)
    
    static var previews: some View {
        Group {
            
            StatefulPreviewWrapper(basicItem) { item in
                TodoItemRow(item: item)
                    .previewDisplayName(RowKey.basicItem)
            }
            
            
            TodoItemRow(item: .constant(item))
                .previewDisplayName(RowKey.descriptionItem)
            
        }
        .previewLayout(RowKey.previewLayout)
    }
}
