//
//  FullImageViewController.swift
//  GalleryRickAndMorty
//
//  Created by Angelina on 14.02.2021.
//

import UIKit

class FullImageViewController: UIViewController {
    
    //MARK: - Public Properties
    var characterImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    var image = String()
    var date = String()
    var dismissButton = UIButton()
    var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 21)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.textColor = .black
        return label
    }()
    var visualEffect = UIVisualEffectView()
    
    //MARK: - Lifecycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Private funcs
    private func configureUI() {
        view.backgroundColor = .clear
        view.addSubview(visualEffect)
        view.addSubview(characterImage)
        view.addSubview(dismissButton)
        view.addSubview(dateLabel)
        visualEffect.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        characterImage.snp.makeConstraints { make in
            make.top.leading.equalTo(view).offset(50)
            make.bottom.trailing.equalTo(view).offset(-50)
            make.center.equalTo(view)
        }
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(view).offset(70)
            make.leading.equalTo(view).offset(50)
            make.trailing.equalTo(view).offset(-50)
        }
        dismissButton.snp.makeConstraints { make in
            make.edges.equalTo(characterImage)
        }
        
        visualEffect.effect = UIBlurEffect(style: .light)
        characterImage.loadImage(withUrl: image)
        dateLabel.text = date
        dismissButton.addTarget(self, action: #selector(popToRootVC), for: .touchUpInside)
    }
    
    //MARK: - @objc funcs
    @objc func popToRootVC() {
        dismiss(animated: true)
    }
}
