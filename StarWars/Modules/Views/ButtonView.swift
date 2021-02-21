import UIKit

class ButtonView: UIView {
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        button.setTitleColor(.systemPink, for: .normal)
        button.addTarget(self, action: #selector(changeBackgroundIn(_:)), for: .touchDown)
        return button
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(title: String, target: Any, selector: Selector) {
        self.init(frame: .zero)
        configure(title: title, target: target, selector: selector)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = bounds.size.height / 2
        clipsToBounds = true
    }
    
    private func configure(title: String, target: Any, selector: Selector) {
        
        backgroundColor = .clear
        
        layer.borderWidth = 1.5
        layer.borderColor = UIColor.systemPink.cgColor
        
        button.setTitle(title, for: .normal)
        button.addTarget(target, action: selector, for: .touchUpInside)
        
        addSubview(button)
        
        button.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
    @objc private func changeBackgroundIn(_ sender: UIButton) {
        print("TOUCH")
        let view = self
        UIView.animate(withDuration: 0.2) {
            view.backgroundColor = .systemPink
            if #available(iOS 13.0, *) {
                sender.setTitleColor(.systemBackground, for: .normal)
            } else {
                sender.setTitleColor(.white, for: .normal)
            }
        } completion: { _ in
            view.backgroundColor = .clear
            sender.setTitleColor(.systemPink, for: .normal)
        }
    }
}
