//
//  GalleryVC + Extension.swift
//  GalleryRickAndMorty
//
//  Created by Angelina on 14.02.2021.
//

import UIKit

extension GalleryViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //MARK: - Collection View Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        (AppStorage().isOnlineNow ?? false) ? (album?.results.count ?? 0) : (AppStorage().name?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryCell.identifier, for: indexPath) as! GalleryCell
         
        if AppStorage().isOnlineNow ?? false {
            cell.configureUI(imageUrl: album?.results[indexPath.item].image ?? "",
                             name: album?.results[indexPath.item].name ?? "")
        } else {
            cell.configureUI(imageUrl: AppStorage().image?[indexPath.item] ?? "", name: AppStorage().name?[indexPath.item] ?? "")
        }
        
        return cell
    }
    
    //MARK: - Collection View Delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = FullImageViewController()
        
       if (AppStorage().isOnlineNow ?? false) {
        vc.image = album?.results[indexPath.item].image ?? ""
       } else {
        vc.image = AppStorage().image?[indexPath.item] ?? ""
       }
        
        vc.date = AppStorage().date ?? ""
        present(vc, animated: true)
    }

    //MARK: - Collection View Layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 50
    }
}

