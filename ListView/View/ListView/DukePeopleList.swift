//
//  ListView.swift
//  Hugo
//
//  Created by Hugooooo on 9/28/23.
//

import SwiftUI

struct DukePeopleList: View {
    
    @EnvironmentObject var dataModel: DukePersonDict
    @State private var showDownloadIcon = true
    @State private var showDownloadingProgress = false
    @State private var showAdvanceSearch = false
    @State private var showDownloadMoreOptions = false
    @State private var searchText = ""
    @State private var isRegexSearch = false
    @State private var isFieldSearch = false
    @State private var downloadReplace = false
    @State private var isEditViewActive = false
    @State private var selectedDUID: Int = -1
    
    var peopleList: [DukePerson] {
        return Array(dataModel.people.values)
    }
    
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    HStack {
                        Text("Duke People")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.leading, 16)
                        Spacer()
                        
                        Button(action: {
                            selectedDUID = -1
                            isEditViewActive = true
                        }) {
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color.gray)
                                .rotationEffect(.degrees(360))
                        }
                        .background(Color.white)
                        .clipShape(Circle())
                        .padding(.trailing, 16)
                        
                    }
                    .padding(.top, 16)
                    .padding(.bottom, -8)
                    
                    ZStack(alignment: .leading) {
                        TextField("Search any keywords", text: $searchText)
                            .padding(.leading, 36)
                            .padding(.trailing, 16)
                            .frame(height: 36)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .padding([.leading, .trailing], 16)
                            .padding(.top, 16)
                            .padding(.bottom, 8)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                        
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .padding(.leading, 24)
                                .padding(.top, 8)
                            Spacer()
                        }
                    }
                    
                    
                    if showAdvanceSearch {
                        Toggle("Regex Search", isOn: $isRegexSearch)
                            .padding(.horizontal)
                            .padding(.leading, 8)
                            .padding(.trailing, 8)
                        
                        HStack {
                            Text(verbatim: "e.g. (Student).*?(ECE|COMP).*?(dancing|dance)")
                                .padding(.horizontal)
                                .padding(.leading, 8)
                                .font(.footnote)
                                .foregroundColor(.gray)
                            Spacer()
                        }
                        
                        Toggle("Field Search", isOn: $isFieldSearch)
                            .padding(.horizontal)
                            .padding(.leading, 8)
                            .padding(.trailing, 8)
                        
                        HStack {
                            Text(verbatim: "e.g. ln=Chen, desc=ECE, etc. Only one field is allowed")
                                .padding(.horizontal)
                                .padding(.leading, 8)
                                .font(.footnote)
                                .foregroundColor(.gray)
                            Spacer()
                        }
                        
                        HStack {
                            Button(action: {
                                showAdvanceSearch = false
                                isFieldSearch = false
                                isRegexSearch = false
                            }) {
                                HStack {
                                    Text("Back to Simple Search")
                                        .font(.footnote)
                                    Image(systemName: "arrow.up.circle")
                                        .font(.system(size: 12))
                                }
                            }
                            .padding(.top, 8)
                            .padding(.leading, 24)
                            .padding(.bottom, 8)
                            Spacer()
                        }
                        
                    } else {
                        HStack {
                            Button(action: {
                                showAdvanceSearch = true
                            }) {
                                HStack {
                                    Text("Advanced Search")
                                        .font(.footnote)
                                    Image(systemName: "arrow.down.circle")
                                        .font(.system(size: 12))
                                }
                                .foregroundColor(Color.blue)
                            }
                            .padding(.leading, 24)
                            .padding(.bottom, 8)
                            Spacer()
                        }
                    }
                    
                    ShadowedDivider()
                    
                    List {
                        Section(header: Text("Professor").font(.title2).fontWeight(.bold)) {
                            let filteredProfessors = filterByRole(.Professor, searchText, peopleList, isRegexSearch, isFieldSearch)
                            if !filteredProfessors.isEmpty {
                                ForEach(filteredProfessors, id: \.DUID) { professor in
                                    NavigationLink(
                                        destination: DukePeopleListDetails(dukePerson: professor)
                                    ) {
                                        DukePeopleListItem(dukePerson: professor)
                                    }
                                    .swipeActions {
                                        Button(action: {
                                            if dataModel.delete(professor.DUID) {}
                                        }) {
                                            Label("Delete", systemImage: "trash")
                                        }
                                        .tint(.red)
                                        
                                        Button(action: {
                                            selectedDUID = professor.DUID
                                            isEditViewActive = true
                                        }) {
                                            Label("Edit", systemImage: "pencil")
                                        }
                                        .tint(.blue)
                                    }
                                }
                            } else {
                                NoResult()
                            }
                        }
                        .listRowSeparator(.hidden)
                        
                        Section(header: Text("TAs").font(.title2).fontWeight(.bold)) {
                            let filteredTAs = filterByRole(.TA, searchText, peopleList, isRegexSearch, isFieldSearch)
                            if !filteredTAs.isEmpty {
                                ForEach(filteredTAs, id: \.DUID) { ta in
                                    NavigationLink(
                                        destination: DukePeopleListDetails(dukePerson: ta)
                                    ) {
                                        DukePeopleListItem(dukePerson: ta)
                                    }
                                    .swipeActions {
                                        Button(action: {
                                            if dataModel.delete(ta.DUID) {}
                                        }) {
                                            Label("Delete", systemImage: "trash")
                                        }
                                        .tint(.red)
                                        
                                        Button(action: {
                                            selectedDUID = ta.DUID
                                            isEditViewActive = true
                                        }) {
                                            Label("Edit", systemImage: "pencil")
                                        }
                                        .tint(.blue)
                                    }
                                }
                            } else {
                                NoResult()
                            }
                        }
                        .listRowSeparator(.hidden)
                        
                        Section(header: Text("Students").font(.title2).fontWeight(.bold)) {
                            let filteredStudents = filterByRole(.Student, searchText, peopleList, isRegexSearch, isFieldSearch)
                            if !filteredStudents.isEmpty {
                                ForEach(filteredStudents, id: \.DUID) { student in
                                    NavigationLink(
                                        destination: DukePeopleListDetails(dukePerson: student)
                                    ) {
                                        DukePeopleListItem(dukePerson: student)
                                    }
                                    .swipeActions {
                                        Button(action: {
                                            if dataModel.delete(student.DUID) {}
                                        }) {
                                            Label("Delete", systemImage: "trash")
                                        }
                                        .tint(.red)
                                        
                                        Button(action: {
                                            selectedDUID = student.DUID
                                            isEditViewActive = true
                                        }) {
                                            Label("Edit", systemImage: "pencil")
                                        }
                                        .tint(.blue)
                                    }
                                }
                            } else {
                                NoResult()
                            }
                        }
                        .listRowSeparator(.hidden)
                        
                        Section(header: Text("Others").font(.title2).fontWeight(.bold)) {
                            let filteredOthers = filterByRole(.Other, searchText, peopleList, isRegexSearch, isFieldSearch)
                            if !filteredOthers.isEmpty {
                                ForEach(filteredOthers, id: \.DUID) { others in
                                    NavigationLink(
                                        destination: DukePeopleListDetails(dukePerson: others)
                                    ) {
                                        DukePeopleListItem(dukePerson: others)
                                    }
                                    .swipeActions {
                                        Button(action: {
                                            if dataModel.delete(others.DUID) {}
                                        }) {
                                            Label("Delete", systemImage: "trash")
                                        }
                                        .tint(.red)
                                        
                                        Button(action: {
                                            selectedDUID = others.DUID
                                            isEditViewActive = true
                                        }) {
                                            Label("Edit", systemImage: "pencil")
                                        }
                                        .tint(.blue)
                                    }
                                }
                            } else {
                                NoResult()
                            }
                        }
                        .listRowSeparator(.hidden)
                    }
                    .listStyle(.plain)
                    .refreshable {
                        if !dataModel.isDownloading {
                            if !showDownloadIcon {
                                if (dataModel.reset()) {
                                    showDownloadingProgress = false
                                    showDownloadIcon = true
                                }
                            } else {
                                showDownloadingProgress = true
                                showDownloadIcon = false
                                if dataModel.download(website: url, auth: authString) {
                                    print("Downloaded")
                                } else {
                                    print("Failed to download")
                                }
                            }
                        }
                    }
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        VStack {
                            if (!showDownloadMoreOptions) {
                                Button(action: {
                                    if !dataModel.isDownloading {
                                        if (dataModel.reset()) {
                                            showDownloadingProgress = false
                                            showDownloadIcon = true
                                        }
                                    }
                                }) {
                                    Image(systemName: "arrow.clockwise.circle.fill")
                                        .resizable()
                                        .frame(width: 48, height: 48)
                                        .foregroundColor(Color.red)
                                        .rotationEffect(.degrees(360))
                                }
                                .background(Color.white)
                                .clipShape(Circle())
                                .padding(.trailing, 16)
                                .padding(.bottom, 16)
                                .shadow(color: Color.black.opacity(0.4), radius: 4, x: 0, y: 3)
                                
                                Button(action: {
                                    if !dataModel.isDownloading {
                                        showDownloadMoreOptions = true
                                    }
                                }) {
                                    Image(systemName: "arrow.down.circle.fill")
                                        .resizable()
                                        .frame(width: 48, height: 48)
                                        .foregroundColor(Color.accentColor)
                                }
                                .background(Color.white)
                                .clipShape(Circle())
                                .padding(.trailing, 16)
                                .padding(.bottom, 48)
                                .shadow(color: Color.black.opacity(0.4), radius: 4, x: 0, y: 3)
                                
                            } else {
                                Button(action: {
                                    showDownloadMoreOptions = false
                                    downloadReplace = true
                                    showDownloadingProgress = true
                                    showDownloadIcon = false
                                    dataModel.downloadReplace = true
                                    if dataModel.download(website: url, auth: authString) {
                                        print("Downloaded")
                                    } else {
                                        print("Failed to download")
                                    }
                                }) {
                                    Image(systemName: "arrow.uturn.right.circle.fill")
                                        .resizable()
                                        .frame(width: 48, height: 48)
                                        .foregroundColor(Color.accentColor)
                                }
                                .background(Color.white)
                                .clipShape(Circle())
                                .padding(.trailing, 16)
                                .padding(.bottom, 16)
                                .offset(y: -74)
                                .shadow(color: Color.black.opacity(0.4), radius: 4, x: 0, y: 3)
                                
                                Text("Replace")
                                    .font(.footnote)
                                    .foregroundColor(Color.accentColor)
                                    .padding(.trailing, 16)
                                    .padding(.top, -16)
                                    .offset(y: -74)
                                    .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 3)
                                    
                                Button(action: {
                                    showDownloadMoreOptions = false
                                    downloadReplace = true
                                    showDownloadingProgress = true
                                    showDownloadIcon = false
                                    dataModel.downloadReplace = false
                                    if dataModel.download(website: url, auth: authString) {
                                        print("Downloaded")
                                    } else {
                                        print("Failed to download")
                                    }
                                }) {
                                    Image(systemName: "arrow.down.to.line.circle.fill")
                                        .resizable()
                                        .frame(width: 48, height: 48)
                                        .foregroundColor(Color.accentColor)
                                }
                                .background(Color.white)
                                .clipShape(Circle())
                                .offset(y: -64)
                                .padding(.trailing, 16)
                                .padding(.bottom, 16)
                                .shadow(color: Color.black.opacity(0.4), radius: 4, x: 0, y: 3)
                                
                                Text("Update")
                                    .font(.footnote)
                                    .foregroundColor(Color.accentColor)
                                    .padding(.trailing, 16)
                                    .padding(.bottom, 16)
                                    .offset(y: -64)
                                    .padding(.top, -16)
                                    .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 3)
                                
                                Button(action: {
                                    showDownloadMoreOptions = false
                                }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .resizable()
                                        .frame(width: 48, height: 48)
                                        .foregroundColor(Color.red)
                                }
                                .background(Color.white)
                                .clipShape(Circle())
                                .offset(y: -74)
                                .padding(.trailing, 16)
                                .padding(.bottom, 16)
                                .shadow(color: Color.black.opacity(0.4), radius: 4, x: 0, y: 3)
                                
                                Text("Cancel")
                                    .font(.footnote)
                                    .foregroundColor(Color.red)
                                    .padding(.trailing, 16)
                                    .padding(.bottom, 16)
                                    .offset(y: -74)
                                    .padding(.top, -16)
                                    .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 3)
                            }
                        }
                    }
                    .frame(minHeight: 0, maxHeight: 48)
                    .background(Color(red: 1, green: 1, blue: 1, opacity: 0))
                    .offset(x: 0, y: dataModel.isDownloading ? -64 : -80)
                    .padding(.bottom, -100)
                    
                    if showDownloadingProgress {
                        HStack {
                            VStack {
                                HStack {
                                    Text("Downloading... \(Int(100*dataModel.downloadProgress))%")
                                        .font(.system(size: 16))
                                    
                                    Spacer()
                                }
                                
                                ProgressView(value: dataModel.downloadProgress)
                                    .progressViewStyle(LinearProgressViewStyle())
                                    .foregroundColor(Color.accentColor)
                                    .opacity(1)
                                
                                Spacer()
                            }
                            .padding(.leading, 16)
                            .padding(.trailing, 16)
                        }
                        .frame(height: 48)
                    }
                    
                }
                
                
            }
            .onChange(of: dataModel.isDownloading) { newValue in
                if !newValue {
                    showDownloadingProgress = false
                    showDownloadIcon = false
                }
            }
            .blur(radius: isEditViewActive ? 10 : 0)
            .sheet(isPresented: $isEditViewActive) {
                AddEditView(DUID: selectedDUID).environmentObject(dataModel)
            }
            
            ShadowedDivider()
                .rotationEffect(.degrees(180))
        }
    }
}

struct DukePeopleList_Previews: PreviewProvider {
    static var previews: some View {
        
        DukePeopleList()
            .environmentObject(DukePersonDict())
    }
}
