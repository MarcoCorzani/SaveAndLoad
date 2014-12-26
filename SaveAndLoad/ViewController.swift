//
//  ViewController.swift
//  SaveAndLoad
//
//  Created by Marco F.A. Corzani on 26.12.14.
//  Copyright (c) 2014 Alphaweb. All rights reserved.
//

import UIKit

// Documents Directory:    /Users/Marco/Library/Developer/CoreSimulator/Devices/65AC762C-00A1-4895-A9A9-E93D80F07B1A/data/Containers/Data/Application/DEB016A3-FA54-4584-90E0-F39ED7FBA334/Documents


func documentsDirectory() -> String {

let documentsFolderPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as String

     return documentsFolderPath
}

func fileInDocumentsDirectory(filename: String) -> String {
    
    return documentsDirectory().stringByAppendingPathComponent(filename)
}


//  File in Documents Directory:  /Users/Marco/Library/Developer/CoreSimulator/Devices/65AC762C-00A1-4895-A9A9-E93D80F07B1A/data/Containers/Data/Application/DEB016A3-FA54-4584-90E0-F39ED7FBA334/Documents/photo.jpg



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let documents = documentsDirectory()
        println("Documents: \(documents)")
        
        let imagePath = fileInDocumentsDirectory("turkey.jpg")
        println("Photo path: \(imagePath)")
    
            // Load image from resource bundle (read only)
            var image = UIImage(named: "Funny-Turkey-Pictures-2014.jpg")
            if image != nil {
                // Save it to our documents folder
                println(image)
                
                let result = saveImage(image!, path: imagePath)
                println("saveImage: \(result)")
            }
        }

    func saveImage(image: UIImage, path: String) -> Bool {
        
        let jpgImageData = UIImageJPEGRepresentation(image, 1.0)  // Oder UIImagePNGRepresentation
    
        let result = jpgImageData.writeToFile(path, atomically: true)
    
        return result
    }

}


















