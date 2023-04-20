import Foundation

extension String {
    var stringWithPoint: String {
        self.contains(".") ? self.replacingOccurrences(of: ".", with: ",") : self
    }
}
