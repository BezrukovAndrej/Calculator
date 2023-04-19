import UIKit

extension UIStackView {
    
    convenience init(subview: [UIView]) {
        self.init(arrangedSubviews: subview)
        self.axis = .horizontal
        self.spacing = 1
        self.distribution = .fillEqually
    }
}
