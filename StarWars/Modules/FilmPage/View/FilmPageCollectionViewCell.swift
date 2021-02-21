//
//  FilmPageCollectionViewCell.swift
//  StarWars
//
//  Created by Anastas Smekh on 20.02.2021.
//

import UIKit

class FilmPageCollectionViewCell: UICollectionViewCell {
    
    private lazy var imagePeople: UIImageView = {
        let image = UIImageView()
//        image.contentMode = .sc
        image.clipsToBounds = true
        image.image = #imageLiteral(resourceName: "GoogleService-Info")
        image.backgroundColor = .black
        image.layer.cornerRadius = 40
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var namePeople: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .light)
        label.text = "Test"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.contentView.addSubview(imagePeople)
        imagePeople.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.height.equalTo(80)
        }
        
        self.contentView.addSubview(namePeople)
        namePeople.snp.makeConstraints { make in
            make.top.equalTo(imagePeople.snp.bottom).offset(5)
            make.centerX.equalTo(imagePeople)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addData(name: String, image: UIImage) {
        namePeople.text = name
        imagePeople.image = image
    }
    
    
}
