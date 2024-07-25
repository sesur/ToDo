import Foundation

class TodoItemsListViewModel: ObservableObject {
    @Published var items: [TodoItem] = []
    
    func loadItems() {
        guard items.isEmpty else { return }
        
        do {
            self.items = try .fromJSON(named: "TodoItems")
        } catch {
            fatalError("\(error)")
        }
    }
    
    func reorder() {
        items.sort(by: { !$0.isDone && $1.isDone })
    }
    
    func removeItem(at indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from indexSet: IndexSet, to newIndex: Int) {
        items.move(fromOffsets: indexSet, toOffset: newIndex)
    }
}
