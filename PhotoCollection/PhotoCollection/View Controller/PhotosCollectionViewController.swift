//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Enzo Jimenez-Soto on 4/23/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTheme()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setTheme()
        collectionView.reloadData()
    }
    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowPhotoDetailSegue" {
            guard let viewController = segue.destination as? PhotoDetailViewController else { return }

            guard let indexPathArray = collectionView.indexPathsForSelectedItems else { return }
            viewController.themeHelper = themeHelper
            viewController.photoController = photoController
            viewController.photo = photoController.photos[indexPathArray[0].row]
            
        } else if segue.identifier == "SelectThemeSegue" {
            guard let viewController = segue.destination as? ThemeSelectionViewController else { return }

            viewController.themeHelper = themeHelper
            
        } else if segue.identifier == "AddPhotoSegue" {
            guard let viewController = segue.destination as? PhotoDetailViewController else { return }

            viewController.themeHelper = themeHelper
            viewController.photoController = photoController
        }
    }
    

    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else { fatalError("Not a photo collection view cell") }
    
        let photo = photoController.photos[indexPath.row]
        
        cell.photo = photo
        
        return cell
    }

    func setTheme() {
        guard let theme: String = themeHelper.themePreference else { return }
        if theme == "Dark" {
            collectionView.backgroundColor = .darkGray
        } else {
            collectionView.backgroundColor = .blue
        }
    }
}
