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
    @State private var shouldAnimate = false
    @State private var isFadingIn = false
    @State private var isAnimating = false
    var dukePerson: DukePerson
    
    var body: some View {
        ZStack {
            // Background Gradient
            RandomGradientView()
                .ignoresSafeArea()
                .opacity(0.6)
            
            ScrollView {
                ZStack {
                    // Profile Image
                    let normalImage : UIImage = {
                        let util = GetImageBase64()
                        let image = util.imageFromBase64(base64String: dukePerson.picture)
                        if image == nil {
                            return UIImage(systemName: "photo")!
                        }
                        return image!
                    }()
                    let removalImage: UIImage = {
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
                    Image(uiImage: normalImage)
                        .resizable()
                        .frame(width: 200, height: 200)
                        .opacity(shouldAnimate ? 0.0 : 1.0)
                        .onAppear {
                            withAnimation(.easeIn(duration: 1.0)) {
                                shouldAnimate = true
                            }
                        }
                    
                    
                    Image(uiImage: removalImage)
                        .resizable()
                        .frame(width: 200, height: 200)
                }
                .padding(.top, 16)
                
                VStack {
                    // Basic Info Card
                    VStack(alignment: .leading) {
                        BlurView(text: dukePerson.fName + " " + dukePerson.lName, textSize: 28, startTime: 0)
                            .font(.title)
                            .foregroundColor(.primary)
                            .padding([.bottom], 8)
                        
                        Grid(alignment: .leading, horizontalSpacing: 32) {
                            GridRow {
                                RouletteCharacters(text: "NetID: \(dukePerson.netid ?? "")", delay: 0.5)
                                RouletteCharacters(text: "DUID: \(String(dukePerson.DUID))", delay: 2.5)
                            }
                            .padding([.bottom], 2)
                            GridRow {
                                RouletteCharacters(text: "Gender: \(dukePerson.gender.rawValue)", delay: 0.5)
                                RouletteCharacters(text: "Role: \(dukePerson.role.rawValue)", delay: 2.5)
                            }
                            .padding([.bottom], 2)
                            
                            RouletteCharacters(text: "Email: \(String(dukePerson.email).trimmingCharacters(in: .whitespacesAndNewlines))", delay: 0.5)
                                .padding([.bottom], 2)
                            
                            RouletteCharacters(text: "From: \(String(dukePerson.from).trimmingCharacters(in: .whitespacesAndNewlines))", delay: 0.5)
                            
                            Text(junkString)
                                .foregroundColor(.clear)
                                .frame(height: 0)
                        }
                        .padding(.bottom, -8)
                        
                    }
                    .padding()
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                    .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 3)
                    .padding(10)
                    
                    // Hobby & Languages & Mobie Info Card
                    ZStack {
                        GeometryReader { geometry in
                            Image("Namecard")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        .padding(11)
                        .offset(x: isFadingIn ? 0 : -100)
                        .opacity(isFadingIn ? 0.8 : 0.0)
                        .onAppear {
                            withAnimation(.easeIn(duration: 0.7)) {
                                isFadingIn = true
                            }
                        }
                        
                        BadgeView(icon: getHobby(dukePerson: dukePerson), height: 65, width: 65)
                            .offset(x: -115, y: 0)
                            .opacity(isFadingIn ? 1.0 : 0.0)
                            .onAppear {
                                withAnimation(.easeIn(duration: 1.0)) {
                                    
                                }
                            }
                        
                        let language = getLanguage(dukePerson: dukePerson)
                        BadgeView(icon: language, height: 65, width: 65)
                            .offset(x: 0, y: 0)
                            .opacity(isFadingIn ? 1.0 : 0.0)
                            .onAppear {
                                withAnimation(.easeIn(duration: 1.0)) {
                                    
                                }
                            }
                        
                        BadgeView(icon: getAnotherLanguage(dukePerson: dukePerson, firstLanguage: language), height: 65, width: 65)
                            .offset(x: 115, y: 0)
                            .opacity(isFadingIn ? 1.0 : 0.0)
                            .onAppear {
                                withAnimation(.easeIn(duration: 1.0)) {
                                    
                                }
                            }
                        
                        
                    }
//                    
//                    // Team Info Card
//                    if let team = dukePerson.team {
//                        VStack(alignment: .leading) {
//                            Text("Team")
//                                .font(.title3)
//                                .padding(.bottom, 8)
//                            Text("\(team)")
//                                .font(.subheadline)
//                            Text(junkString)
//                                .foregroundColor(.clear)
//                                .frame(height: 0)
//                        }
//                        .padding()
//                        .font(.subheadline)
//                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
//                        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 3)
//                        .padding(10)
//                    }
                    
                    // Description Card
                    VStack(alignment: .leading) {
                        Text("About \(dukePerson.fName)")
                            .font(.title3)
                            .padding(.bottom, 8)
                        
                        Text(dukePerson.description)
                            .font(.subheadline)
                        
                        Text(junkString)
                            .foregroundColor(.clear)
                            .frame(height: 0)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                    .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 3)
                    .padding(10)
                    .frame(minHeight: 200)
                    
                    Spacer()
                }
                
                VStack {}
                    .frame(height: 100)
            }
            .navigationTitle(dukePerson.fName)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct DukePeopleListDetails_Previews: PreviewProvider {
    static let dataModel = DukePersonDict()
    
    static var previews: some View {
        DukePeopleListDetails(dukePerson: DukePersonDict().people[ProfDUID]!)
            .environmentObject(dataModel)
    }
}
