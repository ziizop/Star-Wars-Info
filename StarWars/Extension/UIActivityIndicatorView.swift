import UIKit

extension UIActivityIndicatorView {
    
    static var indicator: UIActivityIndicatorView = {
        
        var ai: UIActivityIndicatorView
        
        if #available(iOS 13.0, *) {
            ai = UIActivityIndicatorView(style: .medium)
        } else {
            ai = UIActivityIndicatorView(style: .gray)
        }
        
        ai.hidesWhenStopped = true
        return ai
    }()
    
}
