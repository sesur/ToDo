import SwiftUI

struct TodoItemListView: View {
    
    @StateObject var viewModel = TodoItemsListViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($viewModel.items) { $item in
                    NavigationLink(value: item) {
                        TodoItemRow(item: $item.onNewValue {
                            viewModel.reorder()
                        })
                    }
                }
                // Point free syntax -> pass the reference of the method
                .onDelete(perform: viewModel.removeItem(at:))
                .onMove(perform: viewModel.moveItem(from:to:))
                
            }
            .listStyle(.grouped)
            .navigationTitle(LocalizedStringKey(NavigationKey.title))
            .navigationDestination(for: TodoItem.self) { item in
                
                if let selectedItem = viewModel.items.first(where: { $0.id == item.id }) {
                    let selectedItemBinding = Binding(
                        get: { selectedItem },
                        set: { newValue in
                            if let index = viewModel.items.firstIndex(where: { $0.id == item.id }) {
                                viewModel.items[index] = newValue
                            }
                        }
                    )
                    TodoItemDetailsView(item: selectedItemBinding)
                }
            }
            
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
            }
            .onAppear {
                viewModel.loadItems()
            }
        }
    }
}

#Preview {
    TodoItemListView()
}
