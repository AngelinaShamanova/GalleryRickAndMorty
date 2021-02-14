//
//  GalleryCell.swift
//  GalleryRickAndMorty
//
//  Created by Angelina on 14.02.2021.
//

import UIKit

class GalleryCell: UICollectionViewCell {
    
    //MARK: - Public Properties
    static let identifier = "albumCell"
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 21)
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    var characterImage: UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 12
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    func configureUI(imageUrl: String, name: String) {
        addSubview(nameLabel)
        addSubview(characterImage)
        
        nameLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self)
            make.bottom.equalTo(characterImage.snp.top).offset(-15)
        }
        characterImage.snp.makeConstraints { make in
            make.width.height.equalTo(200)
            make.center.equalTo(self)
        }
        
        nameLabel.text = name
        characterImage.loadImage(withUrl: imageUrl)
    }
}
