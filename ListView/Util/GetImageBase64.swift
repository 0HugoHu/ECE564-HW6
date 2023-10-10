//
//  GetImageBase64.swift
//  Hugo
//
//  Created by Hugooooo on 9/20/23.
//

import Foundation
import UIKit

class GetImageBase64 {
    var image: UIImage?
    var base64Image: String?
    
    init(imageName: String) {
        image = loadImageFromAssets(imageName: imageName)
        base64Image = convertImageToBase64(image: image!)
    }
    
    init() {}
    
    func getBase64Image() -> String? {
        return base64Image
    }
    
    
    func loadImageFromAssets(imageName: String) -> UIImage? {
        if let image = UIImage(named: imageName) {
            return image
        }
        return nil
    }
    
    func convertImageToBase64(image: UIImage) -> String? {
        if let imageData = image.jpegData(compressionQuality: 1.0) {
            return imageData.base64EncodedString()
        }
        return nil
    }
    

    func imageFromBase64(base64String: String) -> UIImage? {
        if let data = Data(base64Encoded: base64String) {
            if let image = UIImage(data: data) {
                return image
            }
        }
        return nil
    }
}
