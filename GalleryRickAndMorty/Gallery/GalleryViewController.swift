//
//  GalleryViewController.swift
//  GalleryRickAndMorty
//
//  Created by Angelina on 14.02.2021.
//

import UIKit

class GalleryViewController: UIViewController {
    
    //MARK: - Public Properties
    var collectionView: UICollectionView!
    var album: GalleryModel?
    var visualEffectWithBlur: UIVisualEffectView = {
        let effectView = UIVisualEffectView()
        effectView.translatesAutoresizingMaskIntoConstraints = true
        return effectView
    }()
    
    //MARK: - Private Properties
    private let viewModel = GalleryViewModel()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "GetSchwifty-Regular", size: 50)
        label.text = "Rick and Morty\ngallery"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    //MARK: - Lifecycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getDataFromNet()
        configureUI()
    }
    
    //MARK: - Private funcs
    private func configureUI() {
        view.applyGradient(colours: [#colorLiteral(red: 0.6742485166, green: 0.8585411906, blue: 0.5487238765, alpha: 1), #colorLiteral(red: 0.509695828, green: 1, blue: 0.5058609843, alpha: 1), #colorLiteral(red: 0, green: 1, blue: 0, alpha: 1)])
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view).offset(120)
            make.width.equalTo(300)
            make.centerX.equalTo(view)
        }
    }
    
    private func configureCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 50, height: UIScreen.main.bounds.width)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(GalleryCell.self, forCellWithReuseIdentifier: GalleryCell.identifier)
        collectionView.allowsSelection = true
        collectionView.allowsMultipleSelection = false
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .clear
        
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.width.height.equalTo(UIScreen.main.bounds.width)
            make.center.equalTo(view)
        }
    }
    
    private func getDataFromNet() {
        viewModel.getAlbum { [weak self] data in
            if !data.results.isEmpty {
                self?.album = data
            }
            self?.configureCollectionView()
        }
    }
}


