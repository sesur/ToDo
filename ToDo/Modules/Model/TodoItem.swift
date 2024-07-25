import Foundation

struct TodoItem: Hashable, Codable, Identifiable {
    let id: UUID
    var title: String
    var description: String?
    var isDone: Bool = false
}
