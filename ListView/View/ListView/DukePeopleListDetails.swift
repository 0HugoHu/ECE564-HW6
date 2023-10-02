//
//  ListViewDetails.swift
//  Hugo
//
//  Created by Hugooooo on 9/28/23.
//

import SwiftUI
import BackgroundRemoval

struct DukePeopleListDetails: View {
    @EnvironmentObject var dataModel: DukePersonDict
    var dukePerson: DukePerson
    
    var body: some View {
        ZStack {
            // Background Gradient
            LinearGradient(gradient: Gradient(colors: [Color(red: 240/255.0, green: 222/255.0, blue: 219/255.0), Color(red: 217/255.0, green: 233/255.0, blue: 244/255.0)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            ScrollView {
                ZStack {
                    // Profile Image
                    var removalImage: UIImage = {
                        do {
                            let util = GetImageBase64()
                            let image = util.imageFromBase64(base64String: dukePerson.picture)
                            if image == nil {
                                return UIImage(systemName: "photo")!
                            }
                            return try BackgroundRemoval().removeBackground(image: image!)
                        } catch {
                            print("Error: \(error)")
                            return UIImage(systemName: "photo")!
                        }
                    }()
                    Image(uiImage: removalImage)
                        .resizable()
                        .frame(width: 200, height: 200)
                        .offset(y: dukePerson.DUID == 1184353 || dukePerson.DUID == 1036039 ? -100 : -120)
                    
                    VStack {
                        // Basic Info Card
                        VStack(alignment: .leading) {
                            Text(dukePerson.fName + " " + dukePerson.lName)
                                .font(.title)
                                .foregroundColor(.primary)
                                .padding([.bottom], 8)
                            
                            Grid(alignment: .leading, horizontalSpacing: 32) {
                                GridRow {
                                    Text("NetID: \(dukePerson.netid ?? "")")
                                    Text("DUID: \(String(dukePerson.DUID))")
                                }
                                GridRow {
                                    Text("Gender: \(dukePerson.gender.rawValue)")
                                    Text("Role: \(dukePerson.role.rawValue)")
                                }
                                GridRow {
                                    Text("Email: \(dukePerson.email)")
                                    Text("From: \(dukePerson.from)")
                                }
                            }
                            .padding(.bottom, -8)
                            Text(junkString)
                                .foregroundColor(.clear)
                                .frame(height: 0)
                        }
                        .padding()
                        .font(.subheadline)
                        .foregroundColor(.black)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 3)
                        .padding(10)
                        
                        
                        // Team Info Card
                        if let team = dukePerson.team {
                            VStack(alignment: .leading) {
                                Text("Team: \(team)")
                                    .font(.subheadline)
                                    .padding()
                                    .padding(.bottom, -8)
                                Text(junkString)
                                    .foregroundColor(.clear)
                                    .frame(height: 0)
                            }
                            .font(.subheadline)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                            .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 3)
                            .padding(10)
                            .offset(y: -10)
                        }
                        
                        // Description Card
                        VStack(alignment: .leading) {
                            Text("About \(dukePerson.fName)")
                                .font(.title3)
                            
                            Text(dukePerson.description)
                                .font(.subheadline)
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 3)
                        .padding(10)
                        .offset(y: -20)
                        
                        Spacer()
                        
                    }
                    .offset(y: 170)
                }
            }
            .navigationTitle(dukePerson.fName)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct DukePeopleListDetails_Previews: PreviewProvider {
    static let dataModel = DukePersonDict()
    
    static var previews: some View {
        DukePeopleListDetails(dukePerson: DukePersonDict().people[DUID]!)
            .environmentObject(dataModel)
    }
}
