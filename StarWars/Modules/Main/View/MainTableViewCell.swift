//
//  MainTableViewCell.swift
//  StarWars
//
//  Created by Anastas Smekh on 12.02.2021.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        
    }
    
    func configure(viewModel: MainRowViewModel) {
        imageView?.image = viewModel.image
        textLabel?.text = viewModel.title
    }
}
