//
//  GroupViewItem.swift
//  Hugo
//
//  Created by Hugooooo on 10/16/23.
//

import SwiftUI

struct GroupViewItem: View {
    var dukePerson: DukePerson
    
    var body: some View {
        let removalImage: UIImage = {
            let util = GetImageBase64()
            let image = util.imageFromBase64(base64String: dukePerson.picture)
            
            return image ?? UIImage(systemName: "photo")!
        }()
        
        VStack(alignment: .leading) {
            Image(uiImage: removalImage)
                .renderingMode(.original)
                .resizable()
                .frame(width: 110, height: 110)
                .cornerRadius(10)
                .shadow(color: Color.gray, radius: 2, x: 0, y: 2)
            Text("\(dukePerson.fName) \(dukePerson.lName)")
                .foregroundColor(.primary)
                .font(.subheadline)
        }
        .padding(.trailing, 15)
        .padding(.top, 4)
    }
}

struct GroupViewItem_Previews: PreviewProvider {
    static var dataModel = DukePersonDict()
    
    static var previews: some View {
        GroupViewItem(dukePerson: dataModel.people[DUID]!)
    }
}

