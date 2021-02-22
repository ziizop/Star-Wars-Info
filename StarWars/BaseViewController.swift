//
//  BaseViewController.swift
//  StarWars
//
//  Created by Anastas Smekh on 12.02.2021.
//

import UIKit

class BaseViewController: UIViewController {
    
    private var activitityIndicator = UIActivityIndicatorView.indicator
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setBackgroundColor() {
        
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            // Fallback on earlier versions
        }
    }
    
    private func subscribeNotifications() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func showActivityIndicator() {
        navigationItem.titleView = activitityIndicator
        activitityIndicator.startAnimating()
    }
    
    func hideActivityIndicator() {
        activitityIndicator.stopAnimating()
        navigationItem.titleView = nil
    }
    
}

    // MARK: - Actions

extension BaseViewController {
    
    @objc func keyboardWillShow(_ notification: Notification) {
        print("\(#file) \(#function)")
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        print("\(#file) \(#function)")
    }
}
