//
//  AddEditView.swift
//  Hugo
//
//  Created by Hugooooo on 10/7/23.
//

import SwiftUI
import MapKit
import LocationPicker
import Combine
import Foundation

extension String {
    func matches(_ pattern: String) -> Bool {
        return self.range(of: pattern, options: .regularExpression, range: nil, locale: nil) != nil
    }
}

struct AddEditView: View {
    @EnvironmentObject var dataModel: DukePersonDict
    @State var dukePerson: DukePerson
    let isEditing: Bool
    @Binding var isPresented: Bool
    
    @State private var coordinates = CLLocationCoordinate2D(latitude: 42.535447, longitude: -37.682355)
    private let coordinatesInit = CLLocationCoordinate2D(latitude: 42.535447, longitude: -37.682355)
    @State private var showMapSheet = false
    @State private var editFrom = false
    @State private var placeName: String = "Loading..."
    @State private var isUploadComplete = false
    @State private var selectedImage: UIImage?
    @State private var isImagePickerPresented = false
    @State private var selectedImageSourceType: ImageSourceType?
    
    
    let editableFieldColor = Color(red: 237/255.0, green: 85/255.0, blue: 106/255.0)
    //    let editableFieldColor = Color.accentColor
    
    let Genders = [Gender.Male.rawValue, Gender.Female.rawValue, Gender.Other.rawValue]
    let Roles = [Role.Student.rawValue, Role.TA.rawValue, Role.Professor.rawValue, Role.Other.rawValue]
    let Programs = ["Bachelor of Arts", "Bachelor of Science", "Bachelor of Engineering", "Master of Arts", "Master of Science", "Master of Engineering", "Doctor of Philosophy", "Other"]
    let Plans = ["Computer Science", "Economics & Computer Science", "Electrical & Computer Engineering", "Other"]
    let Languages = ["C++", "Java", "Python", "Swift"]
    let Hobbies = ["Badminton", "Cooking", "Cycling", "Fitness", "Gaming", "Hiking", "Music", "Swimming"]
    
    @State private var selectedGender: Int = 0
    @State private var selectedRole: Int = 0
    @State private var selectedProgram: Int = 4
    @State private var selectedPlan: Int = 0
    
    init(dukePerson: DukePerson, isEditing: Bool = false, isPresented: Binding<Bool>) {
        self.dukePerson = dukePerson
        self.isEditing = isEditing
        self._isPresented = isPresented
        self._selectedGender = State(initialValue: {
            switch dukePerson.gender {
            case .Male: return 0
            case .Female: return 1
            case .Other: return 2
            case .Unknown: return 2
            }
        }())
        self._selectedRole = State(initialValue: {
            switch dukePerson.role {
            case .Student: return 0
            case .TA: return 1
            case .Professor: return 2
            case .Other: return 3
            case .Unknown: return 3
            }
        }())
        
        let program = dukePerson.program.lowercased()
        let plan = (dukePerson.plan + dukePerson.program).lowercased()
        
        self._selectedProgram = State(initialValue: {
            if program.matches("(under)") {
                return 2
            } else if program.matches("(a&s|ms|science)") {
                return 4
            } else if program.matches("(under|b\\.\\s*|bach).*?(ece|engr|engineer|e\\.)") {
                return 2
            } else if program.matches("(ece|engr|engineer|e\\.)") {
                return 5
            } else {
                return 7
            }
        }())
        self._selectedPlan = State(initialValue: {
            if plan.matches("(econ)") {
                return 1
            } else if plan.matches("(cs|computer science)") {
                return 0
            } else if plan.matches("(ece|elec|egr|engineer)") {
                return 2
            } else {
                return 3
            }
        }())
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background Gradient
                RandomGradientView()
                    .ignoresSafeArea()
                
                ScrollView {
                    
                    // Profile Image
                    let removalImage: UIImage = {
                        let util = GetImageBase64()
                        let image = util.imageFromBase64(base64String: dukePerson.picture)
                        if image == nil {
                            return UIImage(systemName: "photo")!
                        }
                        return image!
                    }()
                    ZStack {
                        // Background Image
                        Image("Avatar")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 200)
                            .edgesIgnoringSafeArea(.all)
                            .shadow(color: Color.black.opacity(0.4), radius: 4, x: 0, y: 3)
                            .onTapGesture {
                                invokeCamera()
                            }
                        
                        // Foreground Image
                        Image(uiImage: removalImage)
                            .resizable()
                            .frame(width: 150, height: 150)
                            .overlay(Circle().stroke(Color.yellow, lineWidth: 2))
                            .clipShape(Circle())
                            .onTapGesture {
                                invokeCamera()
                            }
                        
                        Image(systemName: "square.and.pencil")
                            .offset(x: 90, y: 80)
                            .shadow(color: Color.black.opacity(0.4), radius: 4, x: 0, y: 3)
                            .onTapGesture {
                                invokeCamera()
                            }
                    }
                    .sheet(isPresented: $isImagePickerPresented) {
                        ImagePicker(image: self.$selectedImage)
                    }
                    
                    VStack {
                        // Basic Info Card
                        VStack(alignment: .leading) {
                            
                            Grid(alignment: .leading, horizontalSpacing: 16) {
                                GridRow {
                                    Text("First Name: ")
                                    Text("Last Name: ")
                                }
                                GridRow {
                                    HStack {
                                        Image(systemName: "square.and.pencil")
                                        TextField("First Name", text: $dukePerson.fName)
                                            .font(.title)
                                            .autocorrectionDisabled(true)
                                    }
                                    
                                    HStack {
                                        Image(systemName: "square.and.pencil")
                                        TextField("Last Name", text: $dukePerson.lName)
                                            .font(.title)
                                            .autocorrectionDisabled(true)
                                    }
                                }
                                .foregroundColor(editableFieldColor)
                                
                                
                                Divider()
                                    .padding(.top, 8)
                                
                                GridRow {
                                    Text("DUID: ")
                                    Text("NetID: ")
                                }
                                .padding(.top, 8)
                                GridRow {
                                    HStack {
                                        Image(systemName: "lock.square")
                                        Text("\(String(dukePerson.DUID))")
                                    }
                                    .foregroundColor(.black)
                                    
                                    HStack {
                                        Image(systemName: "square.and.pencil")
                                        TextField("NetID", text: Binding<String>(
                                            get: { dukePerson.netid ?? "" },
                                            set: { dukePerson.netid = $0 }
                                        ))
                                        .bold()
                                        .autocorrectionDisabled(true)
                                        .autocapitalization(.none)
                                    }
                                }
                                .foregroundColor(editableFieldColor)
                                
                                
                                Divider()
                                    .padding(.top, 8)
                                
                                
                                Text("Email: ")
                                    .padding(.top, 8)
                                HStack {
                                    Image(systemName: "square.and.pencil")
                                    TextField("Email", text: $dukePerson.email)
                                        .bold()
                                        .autocorrectionDisabled(true)
                                        .autocapitalization(.none)
                                        .frame(minWidth: 300)
                                }
                                .foregroundColor(editableFieldColor)
                                
                                
                                Divider()
                                    .padding(.top, 8)
                                
                                Text("From: ")
                                    .padding(.top, 8)
                                HStack {
                                    Image(systemName: "globe")
                                        .onTapGesture(perform: {
                                            self.showMapSheet.toggle()
                                            self.editFrom = true
                                        })
                                    if self.editFrom {
                                        Button(action: {
                                            self.showMapSheet.toggle()
                                        }) {
                                            Text("\(placeName)")
                                                .multilineTextAlignment(.leading)
                                                .lineLimit(3)
                                        }
                                        .bold()
                                    } else {
                                        Button("\(dukePerson.from)") {
                                            self.showMapSheet.toggle()
                                            self.editFrom = true
                                        }
                                        .bold()
                                    }
                                }
                                .sheet(isPresented: $showMapSheet) {
                                    NavigationView {
                                        LocationPicker(instructions: "Tap somewhere to select your home", coordinates: $coordinates)
                                        
                                            .navigationTitle("Hugo's Location Picker")
                                            .navigationBarTitleDisplayMode(.inline)
                                            .navigationBarItems(leading: Button(action: {
                                                self.showMapSheet.toggle()
                                            }, label: {
                                                Text("Close").foregroundColor(editableFieldColor)
                                            }))
                                    }
                                }
                                .foregroundColor(editableFieldColor)
                                .padding(.top, 4)
                                
                                
                                Divider()
                                    .padding(.top, 8)
                                
                                Text("Gender: ")
                                    .padding(.top, 8)
                                HStack {
                                    Picker("Select an Option", selection: $selectedGender) {
                                        ForEach(0..<Genders.count, id: \.self) { index in
                                            Text(Genders[index]).tag(index)
                                        }
                                    }
                                    .pickerStyle(SegmentedPickerStyle())
                                }
                                .onChange(of: selectedGender) { newGender in
                                    switch newGender {
                                    case 0: dukePerson.gender = .Male
                                    case 1: dukePerson.gender = .Female
                                    case 2: dukePerson.gender = .Other
                                    default:
                                        dukePerson.gender = .Other
                                    }
                                }
                                
                                
                                Divider()
                                    .padding(.top, 8)
                                
                                
                                Text("Role: ")
                                    .padding(.top, 8)
                                HStack {
                                    Picker("Select an Option", selection: $selectedRole) {
                                        ForEach(0..<Roles.count, id: \.self) { index in
                                            Text(Roles[index]).tag(index)
                                        }
                                    }
                                    .pickerStyle(SegmentedPickerStyle())
                                }
                                .onChange(of: selectedRole) { newRole in
                                    switch newRole {
                                    case 0: dukePerson.role = .Student
                                    case 1: dukePerson.role = .TA
                                    case 2: dukePerson.role = .Professor
                                    case 3: dukePerson.role = .Other
                                    default:
                                        dukePerson.role = .Other
                                    }
                                }
                                
                                
                                Divider()
                                    .padding(.top, 8)
                                
                                
                                Text("Program: ")
                                    .padding(.top, 8)
                                HStack {
                                    Image(systemName: "cursorarrow.click")
                                    Picker("Select an Option", selection: $selectedProgram) {
                                        ForEach(0..<Programs.count, id: \.self) { index in
                                            Text(Programs[index]).tag(index)
                                        }
                                    }
                                    .accentColor(editableFieldColor)
                                }
                                .foregroundColor(editableFieldColor)
                                .onChange(of: selectedProgram) { newProgram in
                                    dukePerson.program = Programs[newProgram]
                                }
                                
                                
                                Divider()
                                    .padding(.top, 8)
                                
                                Text("Plan: ")
                                    .padding(.top, 8)
                                HStack {
                                    Image(systemName: "cursorarrow.click")
                                    Picker("Select an Option", selection: $selectedPlan) {
                                        ForEach(0..<Plans.count, id: \.self) { index in
                                            Text(Plans[index]).tag(index)
                                        }
                                    }
                                    .accentColor(editableFieldColor)
                                    .bold()
                                }
                                .foregroundColor(editableFieldColor)
                                .onChange(of: selectedPlan) { newPlan in
                                    dukePerson.plan = Plans[newPlan]
                                }
                            }
                            
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
                        VStack(alignment: .leading) {
                            Grid(alignment: .leading, horizontalSpacing: 16) {
                                Text("Team: ")
                                HStack {
                                    Image(systemName: "square.and.pencil")
                                    TextField("Team", text: Binding<String>(
                                        get: { dukePerson.team ?? "" },
                                        set: { dukePerson.team = $0 }
                                    ))
                                    .bold()
                                    .autocorrectionDisabled(true)
                                    .autocapitalization(.none)
                                    .frame(minWidth: 300)
                                }
                                .foregroundColor(editableFieldColor)
                                
                                Divider()
                                    .padding(.top, 8)
                                    .padding(.bottom, -16)
                                
                                
                                Text("Movie: ")
                                    .padding(.top, 16)
                                HStack {
                                    Image(systemName: "square.and.pencil")
                                    TextField("Movie", text: Binding<String>(
                                        get: { dukePerson.movie ?? "" },
                                        set: { dukePerson.movie = $0 }
                                    ))
                                    .bold()
                                    .autocorrectionDisabled(true)
                                    .autocapitalization(.none)
                                    .frame(minWidth: 300)
                                }
                                .foregroundColor(editableFieldColor)
                                
                                Divider()
                                    .padding(.top, 8)
                                    .padding(.bottom, -16)
                                
                                Text("Hobby: ")
                                    .padding(.top, 16)
                                HStack {
                                    Image(systemName: "square.and.pencil")
                                    TextField("Hobby", text: Binding<String>(
                                        get: { dukePerson.hobby ?? "" },
                                        set: { dukePerson.hobby = $0 }
                                    ), axis: .vertical)
                                    .bold()
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(3)
                                    .autocorrectionDisabled(true)
                                    .autocapitalization(.none)
                                    .frame(minWidth: 300)
                                }
                                .foregroundColor(editableFieldColor)
                                
                                
                                HStack {
                                    Text("Popular:")
                                        .foregroundColor(.gray)
                                }
                                .padding(.top, 4)
                                
                                LazyVGrid(columns: [GridItem(.flexible(), spacing: 4), GridItem(.flexible(), spacing: 4), GridItem(.flexible(), spacing: 4), GridItem(.flexible(), spacing: 4)], spacing: 4) {
                                    ForEach(Hobbies, id: \.self) { hobby in
                                        CircleText(text: hobby, color: editableFieldColor, isSelected: isHobbySelected(hobby))
                                            .onTapGesture {
                                                toggleHobbySelection(hobby)
                                            }
                                            .frame(minWidth: 100)
                                    }
                                }
                                
                                
                                Divider()
                                    .padding(.top, 8)
                                    .padding(.bottom, -16)
                                
                                
                                Text("Language: ")
                                    .padding(.top, 8)
                                HStack {
                                    Image(systemName: "square.and.pencil")
                                    TextField("Language", text: Binding<String>(
                                        get: { dukePerson.languages?.joined(separator: ", ") ?? "" },
                                        set: { newValue in
                                            let languages = newValue
                                                .split(separator: ",")
                                                .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
                                            dukePerson.languages = languages.isEmpty ? nil : languages
                                        }
                                    ), axis: .vertical)
                                    .bold()
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(3)
                                    .autocorrectionDisabled(true)
                                    .autocapitalization(.none)
                                    .frame(minWidth: 300)
                                }
                                .foregroundColor(editableFieldColor)
                                HStack {
                                    Text("Popular: ")
                                        .foregroundColor(.gray)
                                    ForEach(Languages, id: \.self) { language in
                                        CircleText(text: language, color: editableFieldColor, isSelected: isLanguageSelected(language))
                                            .onTapGesture {
                                                toggleLanguageSelection(language)
                                            }
                                    }
                                }
                                .padding(.top, 4)
                                
                            }
                            Text(junkString)
                                .foregroundColor(.clear)
                                .frame(height: 0)
                        }
                        .padding()
                        .font(.subheadline)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 3)
                        .padding(10)
                        .offset(y: -10)
                        
                        
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
                        .offset(y: -20)
                        
                        Spacer()
                        
                    }
                }
                .navigationTitle(dukePerson.fName)
                .navigationBarTitleDisplayMode(.inline)
                
                Spacer()
                
                HStack {
                    Spacer()
                    VStack {
                        // Upload
                        if dukePerson.DUID == DUID {
                            Button(action: {
                                if dataModel.update(dukePerson) {
                                    if dataModel.upload(website: url, auth: authString, update: true) {
                                        isUploadComplete = true
                                    }
                                }
                            }) {
                                Image(systemName: "arrowshape.up.circle.fill")
                                    .resizable()
                                    .frame(width: 48, height: 48)
                                    .foregroundColor(dukePerson.DUID == DUID && !dataModel.isUploading ? Color.red : Color.gray)
                                    .rotationEffect(.degrees(360))
                            }
                            .background(Color.white)
                            .clipShape(Circle())
                            .padding(.trailing, 16)
                            .padding(.bottom, 16)
                            .shadow(color: Color.black.opacity(0.4), radius: 4, x: 0, y: 3)
                            .disabled(dukePerson.DUID != DUID && !dataModel.isUploading)
                            .onReceive(Just(isUploadComplete)) { uploadComplete in
                                if uploadComplete && !dataModel.isUploading {
                                    self.isPresented = false
                                }
                            }
                        }
                        
                        // Save
                        Button(action: {
                            if isEditing {
                                if dataModel.update(dukePerson) {}
                            } else {
                                if dataModel.add(dukePerson) {}
                            }
                            if dataModel.save() {
                                self.isPresented = false
                            }
                        }) {
                            Image(systemName: "arrowshape.down.circle.fill")
                                .resizable()
                                .frame(width: 48, height: 48)
                                .foregroundColor(Color.accentColor)
                        }
                        .background(Color.white)
                        .clipShape(Circle())
                        .padding(.trailing, 16)
                        .padding(.bottom, 48)
                        .shadow(color: Color.black.opacity(0.4), radius: 4, x: 0, y: 3)
                    }
                }
                .frame(minHeight: 0, maxHeight: 48)
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
                .offset(x: 0, y: 300)
                
            }
            .formStyle(AutomaticFormStyle())
            .navigationTitle(isEditing ? "Edit Profile" : "Add New Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onReceive(Just(coordinates)) { newCoordinates in
            if newCoordinates.latitude != coordinatesInit.latitude && newCoordinates.longitude != coordinatesInit.longitude {
                lookUpCurrentLocation { placemark in
                    if let placemark = placemark {
                        self.placeName = placemark
                        self.dukePerson.from = placeName
                    } else {
                        self.placeName = "Error"
                    }
                }
            }
        }
        .onReceive(Just(selectedImage)) { newImage in
            if newImage != nil {
                let tool = GetImageBase64()
                dukePerson.picture = tool.convertImageToBase64(image: newImage!)!
                //                print(dukePerson.picture)
            }
        }
    }
    
    private var canSaveChanges: Bool {
        return !dukePerson.fName.isEmpty && !dukePerson.lName.isEmpty
    }
    
    func lookUpCurrentLocation(completionHandler: @escaping (String?) -> Void) {
        // Use the last reported location.
        let lastLocation = CLLocation(latitude: self.coordinates.latitude, longitude: self.coordinates.longitude)
        let geocoder = CLGeocoder()
        
        // Look up the location and pass it to the completion handler
        geocoder.reverseGeocodeLocation(lastLocation) { (placemarks, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completionHandler(nil)
            } else if let placemark = placemarks?.first {
                let locality = placemark.locality ?? ""
                let administrativeArea = placemark.administrativeArea ?? ""
                let isoCountryCode = placemark.isoCountryCode ?? ""
                let postalCode = placemark.postalCode ?? ""
                
                let addressString = "\(locality), \(administrativeArea) \(postalCode), \(isoCountryCode)"
                
                completionHandler(addressString)
            } else {
                completionHandler(nil)
            }
        }
    }
    
    func isHobbySelected(_ Hobby: String) -> Bool {
        if let hobby = dukePerson.hobby {
            return hobby.contains(Hobby)
        }
        return false
    }
    
    func isLanguageSelected(_ Language: String) -> Bool {
        if let language = dukePerson.languages {
            return language.contains(Language)
        }
        return false
    }
    
    func toggleHobbySelection(_ hobby: String) {
        if var Hobby = dukePerson.hobby {
            if isHobbySelected(hobby) {
                let updatedHobby = Hobby.replacingOccurrences(of: ", " + hobby, with: "")
                    .replacingOccurrences(of: hobby + ", ", with: "")
                    .replacingOccurrences(of: hobby, with: "")
                    .replacingOccurrences(of: ",,", with: "")
                    .replacingOccurrences(of: ", ,", with: "")
                dukePerson.hobby = updatedHobby.trimmingCharacters(in: .whitespacesAndNewlines)
            } else {
                if !Hobby.isEmpty {
                    Hobby += ", "
                }
                Hobby += hobby
                dukePerson.hobby = Hobby
            }
        } else {
            dukePerson.hobby = hobby
        }
    }
    
    func toggleLanguageSelection(_ language: String) {
        if var languages = dukePerson.languages {
            if isLanguageSelected(language) {
                languages.removeAll { $0 == language }
            } else {
                languages.append(language)
            }
            dukePerson.languages = languages
        } else {
            dukePerson.languages = [language]
        }
    }
    
    func invokeCamera() {
        self.selectedImage = nil
        self.selectedImageSourceType = .background
        self.isImagePickerPresented.toggle()
    }
    
}

struct AddEditView_Previews: PreviewProvider {
    @State static var isPresented = true
    
    static var previews: some View {
        AddEditView(dukePerson: DukePersonDict().find(TA1DUID) ?? DukePerson(DUID: 0), isEditing: true, isPresented: $isPresented)
            .environmentObject(DukePersonDict())
    }
}
