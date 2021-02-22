//
//  PeoplePageTableViewCell.swift
//  StarWars
//
//  Created by Anastas Smekh on 19.02.2021.
//

import UIKit

class PeoplePageTableViewCell: UITableViewCell {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }
        return view
    }()
    
    private lazy var avatarPeople: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 40
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var peopleName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .light)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configView() {
        
    }
    
    func config(_ name: String, _ image: UIImage) {
        
        contentView.addSubview(peopleName)
        contentView.addSubview(avatarPeople)
        addSubview(containerView)
        
        avatarPeople.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(80)
        }
        
        peopleName.snp.makeConstraints { make in
            make.leading.equalTo(avatarPeople.snp.trailing).offset(10)
            make.centerY.equalToSuperview()
        }
        
        peopleName.text = name
        avatarPeople.image = image

    }
}
