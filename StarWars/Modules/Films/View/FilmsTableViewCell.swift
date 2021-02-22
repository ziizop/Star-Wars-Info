//
//  SelectFilmTableViewCell.swift
//  StarWars
//
//  Created by Anastas Smekh on 14.02.2021.
//

import UIKit

class FilmsTableViewCell: UITableViewCell {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }
        return view 
    }()
    
     lazy var bannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "Episod 3")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
     lazy var episodName: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .light)
        return label
    }()
    
     lazy var episodNumber: UILabel = {
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
    
    func configure(number: Int, nameEpisod: String, imageBanner: UIImage) {
        containerView.addSubview(episodName)
        containerView.addSubview(episodNumber)
        containerView.addSubview(bannerImageView)
        
        addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        episodNumber.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(12)
            make.trailing.equalToSuperview().inset(20)
        }
        
        episodName.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(12)
        }
        
        bannerImageView.snp.makeConstraints { make in
            make.width.equalTo(130)
            make.top.equalTo(episodName.snp.bottom).offset(12)
            make.leading.bottom.equalToSuperview().inset(12)
        }
        
        episodName.text = "\(nameEpisod)"
        episodNumber.text = "episod: \(number)"
        bannerImageView.image = imageBanner
    }
}
