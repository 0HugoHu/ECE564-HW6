//
//  ListViewItem.swift
//  Hugo
//
//  Created by Hugooooo on 9/28/23.
//

import SwiftUI


struct DukePeopleListItem: View {
    var dukePerson: DukePerson
    
    var body: some View {
        let removalImage: UIImage = {
            let util = GetImageBase64()
            let image = util.imageFromBase64(base64String: dukePerson.picture)
            
            return image ?? UIImage(systemName: "photo")!
        }()
        return HStack {
            Image(uiImage: removalImage)
                .resizable()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.accentColor.opacity(0.3), lineWidth: 2))
            
            VStack(alignment: .leading) {
                Text("\(dukePerson.fName) \(dukePerson.lName)")
                    .font(.title3)
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .padding(.bottom, 4)
                
                HStack {
                    Text("DUID: \(String(dukePerson.DUID))")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .lineLimit(1)
                    
                    Text("NetID: \(dukePerson.netid ?? "")")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .lineLimit(1)
                        .padding(.leading, 16)
                }
                
                Text("Email: \(dukePerson.email)")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .lineLimit(1)
                
                Text("Program: \(dukePerson.program)")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .lineLimit(1)
                
                Text("Plan: \(dukePerson.plan)")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .lineLimit(1)
            }
            .padding(.leading, 8)
            
            Spacer()
        }
        .padding(10)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 3)
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var dataModel = DukePersonDict()
    
    static var previews: some View {
        Group {
            DukePeopleListItem(dukePerson: dataModel.people[DUID]!)
            DukePeopleListItem(dukePerson: dataModel.people[DUID]!)
        }.previewLayout(.fixed(width: 300, height: 70))
        
    }
}
