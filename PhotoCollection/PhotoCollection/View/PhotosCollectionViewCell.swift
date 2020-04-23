//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Enzo Jimenez-Soto on 4/23/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    

    @IBOutlet weak var photoImageView: UIImageView!
 
    @IBOutlet weak var photoTitleLabel: UILabel!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        if let data = photo?.imageData {
            photoImageView.image = UIImage(data: data)
        }
        photoTitleLabel.text = photo?.title
    }
}
