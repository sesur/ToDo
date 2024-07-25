import SwiftUI

struct TodoItemDetailsView: View {
    
    @Binding var item: TodoItem
    
    var body: some View {
        Form {
            TextField(ItemKey.title, text: $item.title)
                .font(.headline)
            TextField(LocalizedStringKey(ItemKey.description), text: $item.description.whenEmpty(""))
                .font(.subheadline)
        }
        .navigationTitle(LocalizedStringKey(ItemKey.edit))
    }
}

struct TodoItemDetailsView_Previews: PreviewProvider {

    enum RowKey {
        static let bredTitle = "Buy some bred 🥖"
        
    }
    
    static let basicItem = TodoItem(id: UUID(),
                                    title: RowKey.bredTitle,
                                    isDone: true)
    
    static var previews: some View {
        StatefulPreviewWrapper(basicItem) { basicItem in
            TodoItemDetailsView(item: basicItem)
        }
    }
}
