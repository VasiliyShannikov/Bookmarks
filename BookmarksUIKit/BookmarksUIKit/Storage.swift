import Foundation
import UIKit

class Storage {
    @AppDataStorage(key: "linksArr", defaultValue: [BookmarkModel]())
    static var savedLinks
    static var links = [LinkModel1]()
    static var num: Int = 2
}

@propertyWrapper
struct AppDataStorage<T : Codable> {
    private let key: String
    private let defaultValue: T // Generi

    init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T {
        get{
            guard let data = UserDefaults.standard.object(forKey: key) as? Data else{
                return defaultValue
            }
            let value = try? JSONDecoder().decode(T.self, from: data)
            return value ?? defaultValue
        }
        set {
            let data = try? JSONEncoder().encode(newValue)
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}
