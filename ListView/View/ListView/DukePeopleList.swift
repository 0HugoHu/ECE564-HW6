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
    @State private var searchText = ""
    @State private var isRegexSearch = false
    @State private var isFieldSearch = false
    
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
                            .padding(.top, 16)
                            .padding(.bottom, -8)
                        Spacer()
                    }
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
                                    .listRowSeparator(.hidden)
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
                            Button(action: {
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
                            }) {
                                Image(systemName: !showDownloadIcon ? "arrow.clockwise.circle.fill" : "arrow.down.circle.fill")
                                    .resizable()
                                    .frame(width: 48, height: 48)
                                    .foregroundColor(!showDownloadIcon ? Color.red : Color.accentColor)
                                    .rotationEffect(.degrees(!showDownloadIcon ? 360 : 0))
                            }
                            .background(Color.white)
                            .clipShape(Circle())
                            .padding(.trailing, 16)
                            .padding(.bottom, 16)
                            .shadow(color: Color.black.opacity(0.4), radius: 4, x: 0, y: 3)
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
