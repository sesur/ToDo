
import Foundation

extension Array where Element: Decodable {
    static func fromJSON(named fileName: String) throws -> [Element] {
        guard let fileURL = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            fatalError("Couldn't find \(fileName).json in main bundle.")
        }
        
        guard let data = try? Data(contentsOf: fileURL) else {
            fatalError("Couldn't decode \(fileName).json from main bundle.")
        }
        
        do {
            return try JSONDecoder().decode([Element].self, from: data)
        } catch {
            fatalError("Couldn't decode \(fileName).json from main bundle.\n\(error)")
        }
    }
}
