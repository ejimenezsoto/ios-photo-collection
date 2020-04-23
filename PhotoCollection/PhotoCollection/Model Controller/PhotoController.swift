//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Enzo Jimenez-Soto on 4/23/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    init() {
        loadFromPersistentStore()
    }
    
    func createNewPhoto(imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
        saveToPersistentStore()
    }
    
    func updatePhoto(photo: Photo, newData: Data, newTitle: String) {
        if let index = photos.firstIndex(of: photo) {
            photos[index].imageData = newData
            photos[index].title = newTitle
        }
        saveToPersistentStore()
    }
    
    // MARK: Persistence
    
    var persistentFileURL: URL? {
        
        let fileManager = FileManager.default
     
        let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        
        
        let photosURL = documentsDir?.appendingPathComponent("info.plist")
        
        return photosURL
    }
    
   
    func saveToPersistentStore() {
        do {
     
            let encoder = PropertyListEncoder()
            
            let photosPlist = try encoder.encode(photos)
            
            guard let persistentFileURL = persistentFileURL else { return }
            
            try photosPlist.write(to: persistentFileURL)
            
        } catch let saveError {
         
            print("Error saving photos: \(saveError)")
        }
    }
    
    func loadFromPersistentStore() {
        guard let persistentFileURL = persistentFileURL else { return }
        
        do {
           
            let decoder = PropertyListDecoder()
            
            let photosPlist = try Data(contentsOf: persistentFileURL)
            
            let photos = try decoder.decode([Photo].self, from: photosPlist)
            
            self.photos = photos
            
        } catch {
            print("Error decoding photos: \(error)")
        }
    }
}
