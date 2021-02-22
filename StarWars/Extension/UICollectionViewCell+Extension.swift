import  UIKit

extension UICollectionViewCell {
    class var reuseIdentifier: String {
        return String(describing: self)
    }
}
