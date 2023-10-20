//
//  GroupView.swift
//  Hugo
//
//  Created by Hugooooo on 10/16/23.
//

import SwiftUI
import Combine
import Foundation

struct GroupView: View {
    
    @EnvironmentObject var dataModel: DukePersonDict
    @ObservedObject private var dataStore = DataStore()
    
    @State private var isExpanded = false
    @State private var searchText = ""
    @State private var newGroupName: String = ""
    
    
    let validGroupNames = [
        "Seamless",
        "ML Healthcare",
        "Silence is Golden",
        "Asset Mgmt",
        "Chatham County",
        "Canvassers",
        "Soccerheads",
        "New Bee",
        "Widgets",
        "BlueDevil Bites",
        "Invalid Group Names"
    ]
    
    var body: some View {
        let peopleList = { dataModel.people.compactMap { $0.value } }
        let validGroupNamesSet = Set(validGroupNames.map { $0.replacingOccurrences(of: " ", with: "").lowercased() })
        
        let finalTeamList = Array(Set(peopleList().compactMap { $0.team }))
            .filter { teamName in
                let cleanedTeamName = teamName.replacingOccurrences(of: " ", with: "").lowercased()
                return validGroupNamesSet.contains(cleanedTeamName)
            }
            .sorted { team1, team2 in
                let cleanedTeam1 = team1.replacingOccurrences(of: " ", with: "").lowercased()
                let cleanedTeam2 = team2.replacingOccurrences(of: " ", with: "").lowercased()
                return cleanedTeam1 < cleanedTeam2
            }
        
        var customedNames: [(groupName: String, searchText: String)] {
            var list = dataStore.groupNames.enumerated().compactMap { (index, groupName) in
                if index < dataStore.searchTexts.count {
                    return (groupName, dataStore.searchTexts[index])
                }
                return nil
            }
            
            if !newGroupName.isEmpty && !searchText.isEmpty {
                list.append((newGroupName, searchText))
            }
            
            list.sort { (item1: (groupName: String, searchText: String), item2: (groupName: String, searchText: String)) -> Bool in
                return item1.groupName < item2.groupName
            }
            
            return list
        }
        
        
        NavigationView {
            VStack {
                VStack {
                    HStack {
                        Text("Groups")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.leading, 16)
                        Spacer()
                        
                        Button(action: {
                            isExpanded.toggle()
                        }) {
                            Image(systemName: isExpanded ? "minus.circle" : "plus.circle")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color.gray)
                        }
                        .background(Color.white)
                        .clipShape(Circle())
                        .padding(.trailing, 16)
                        
                    }
                    Spacer()
                    if isExpanded {
                        ZStack(alignment: .leading) {
                            TextField("Separate by comma", text: $searchText)
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
                        
                        HStack() {
                            Text(verbatim: fieldSearchHelpText)
                                .font(.footnote)
                                .foregroundColor(.gray)
                                .lineLimit(nil)
                                .frame(height: 70)
                        }
                        .padding()
                        .padding([.top, .bottom], -16)
                        
                        HStack() {
                            Text("Group Name: ")
                                .font(.subheadline)
                                .padding(.top, 8)
                            TextField("Enter group name", text: $newGroupName)
                                .padding()
                                .frame(height: 36)
                                .background(Color(.systemGray6))
                                .cornerRadius(8)
                                .padding(.top, 16)
                                .padding(.bottom, 8)
                                .disableAutocorrection(true)
                                .autocapitalization(.none)
                        }
                        .padding()
                        .padding([.leading, .trailing], 4)
                        .padding([.top, .bottom], -32)
                        
                        HStack() {
                            Button(action: {
                                dataStore.saveGroupName(newGroupName, searchText: searchText)
                                newGroupName = ""
                                searchText = ""
                                isExpanded = false
                            }, label: {
                                Text("Add below list to a new group")
                            })
                            .disabled(newGroupName.isEmpty ? true : false)
                        }
                        .padding()
                    }
                }
                .padding(.top, 16)
                .frame(height: isExpanded ? 270 : 70)
                
                ShadowedDivider()
                    .offset(y: 4)
                
                if isExpanded {
                    let searchResult = filterBySearch(searchText, peopleList())
                    List {
                        ForEach(searchResult, id: \.DUID) { key in
                            DukePeopleListItem(dukePerson: key)
                        }
                        .listRowInsets(EdgeInsets())
                    }
                } else {
                    List {
                        ForEach(finalTeamList, id: \.self) { key in
                            GroupViewRow(categoryName: key, people: dataModel.people.compactMap({ $0.value.team == key ? $0.value : nil }))
                        }
                        
                        GroupViewRow(categoryName: "Invalid Names", people: peopleList().filter { person in
                            let cleanedTeamName = person.team?.replacingOccurrences(of: " ", with: "").lowercased()
                            return !validGroupNamesSet.contains(cleanedTeamName ?? "")
                        })
                        
                        ForEach(customedNames, id: \.groupName) { (name, search) in
                            
                            GroupViewRow(categoryName: name, people: filterBySearch(search, peopleList()))
                            
                        }
                        
                    }
                    .listRowInsets(EdgeInsets())
                }
            }
            
        }
    }
}

struct GroupView_Previews: PreviewProvider {
    static var previews: some View {
        
        GroupView()
            .environmentObject(DukePersonDict())
    }
}

