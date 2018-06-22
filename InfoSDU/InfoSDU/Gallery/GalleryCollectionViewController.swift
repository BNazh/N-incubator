//
//  GalleryCollectionViewController.swift
//  InfoSDU
//
//  Created by Babakhanov Nazhmeddin on 24.02.2018.
//  Copyright © 2018 Nolan. All rights reserved.
//

import UIKit
import Cartography

protocol GalleryImage {
    var currentImage: UIImage{get set}
}

class GalleryCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, GalleryImage {
    
    var currentImage: UIImage = UIImage(named: "car")!
    
    private var images: [UIImage] = [
        UIImage.init(named: "stars_sky_space_car_113629_3840x2160")!,
        UIImage.init(named: "programmer")!,
        UIImage.init(named: "at")!,
        UIImage.init(named: "mmdance")!,
        UIImage.init(named: "car")!,
        UIImage.init(named: "music")!
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView!.register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: "galleryCell")
        view.backgroundColor = UIColor(red: 34/255, green: 47/255, blue: 62/255, alpha: 1)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width/3-1, height: view.bounds.width/3-1)
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "galleryCell", for: indexPath) as! GalleryCollectionViewCell
        cell.backgroundColor = UIColor(red: 34/255, green: 47/255, blue: 62/255, alpha: 1)
        cell.image.image = images[indexPath.row]
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        currentImage = images[indexPath.row]
        
        let controller = GalleryViewController()
        controller.delegate = self
        
        MainViewController.navController.pushViewController(controller, animated: true)
        
    }
    
}
