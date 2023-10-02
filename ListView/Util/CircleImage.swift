//
//  CircleImage.swift
//  Hugo
//
//  Created by Hugooooo on 9/28/23.
//

import SwiftUI
import BackgroundRemoval

struct CircleImage: View {
    var imageBase64: String
    
    var body: some View {
        let removalImage: UIImage = {
            do {
                let util = GetImageBase64()
                let image = util.imageFromBase64(base64String: imageBase64)
                return try BackgroundRemoval().removeBackground(image: image!)
            } catch {
                print("Error: \(error)")
                return UIImage(systemName: "photo")!
            }
        }()
        Image(uiImage: removalImage)
            .resizable()
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 7)
        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(imageBase64: jsonDictionary["picture"] as! String)
    }
}
