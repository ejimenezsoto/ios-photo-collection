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
        
        // Grab the documents directory - MyUser/Documents/
        let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        
        // Create a unique location for the start property list (plist) - MyUser/Documents/stars.plist
        let photosURL = documentsDir?.appendingPathComponent("stars.plist")
        
        return photosURL
    }
    
    // Save the stars array to the persistentFileURL
    func saveToPersistentStore() {
        do {
            // Create the encoder
            let encoder = PropertyListEncoder()
            
            // Convert the stars into a plist
            let photosPlist = try encoder.encode(photos)
            
            // Grab the location that we want to save the plist to
            guard let persistentFileURL = persistentFileURL else { return }
            
            // Save the file to the documents directory
            try photosPlist.write(to: persistentFileURL)
            
        } catch let saveError {
            // Handle the error that gets "thrown" here
            // This catch statement will only run if throwing method fails
            print("Error saving stars: \(saveError)")
        }
    }
    
    func loadFromPersistentStore() {
        guard let persistentFileURL = persistentFileURL else { return }
        
        do {
            // Create the decoder
            let decoder = PropertyListDecoder()
            
            // Grab the data (plist) from the persistentFileURL
            let photosPlist = try Data(contentsOf: persistentFileURL)
            
            // Plist -> [Photo]
            let photos = try decoder.decode([Photo].self, from: photosPlist)
            
            self.photos = photos
            
        } catch {
            print("Error decoding photos: \(error)")
        }
    }
}
