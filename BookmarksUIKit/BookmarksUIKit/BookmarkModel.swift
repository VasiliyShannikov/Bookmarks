import Foundation

class BookmarkModel: Decodable, Encodable {
    var name: String
    var link: String
    init(name: String, link: String) {
        self.name = name
        self.link = link
    }
}

struct LinkModel1 : Codable{
    var id = UUID()
    var name: String?
    var url: String?
}

struct APIRequest: Decodable {
    var links: [LinkModel1]?
}
