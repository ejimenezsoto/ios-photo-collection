//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Enzo Jimenez-Soto on 4/23/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageTitleTextField: UITextField!
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    func updateViews() {
        setTheme()
        if let photo = photo,
            let image = UIImage(data: photo.imageData) {
            imageView.image = image
            imageTitleTextField.text = photo.title
        }
    }
    
    func setTheme() {
        guard let theme = themeHelper?.themePreference else { return }
        
        if theme == "Dark" {
            self.view.backgroundColor = .darkGray
        } else {
            self.view.backgroundColor = .blue
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.contentMode = .scaleAspectFit
            imageView.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addPhoto(_ sender: UIButton) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    
    @IBAction func savePhoto(_ sender: UIBarButtonItem) {
        if let photo = photo,
            let newTitle = imageTitleTextField.text,
            let newData = imageView.image?.pngData() {
            
            photoController?.updatePhoto(photo: photo, newData: newData, newTitle: newTitle)
            
        } else if let newTitle = imageTitleTextField.text,
            let newData = imageView.image?.pngData() {
            
            photoController?.createNewPhoto(imageData: newData, title: newTitle)
        }
        navigationController?.popViewController(animated: true)
    }
}
