import Foundation

class Data111 {
    static var links : [LinkModel1] {
        var linksInner = [LinkModel1]()
        PostData().get { lm in
            linksInner = lm
        }
        return linksInner
    }
}
