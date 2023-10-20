//
//  DataStore.swift
//  Hugo
//
//  Created by Hugooooo on 10/18/23.
//

import Foundation

class DataStore: ObservableObject {
    @Published var groupNames: [String] {
        didSet {
            UserDefaults.standard.set(groupNames, forKey: "GroupNames")
        }
    }

    @Published var searchTexts: [String] {
        didSet {
            UserDefaults.standard.set(searchTexts, forKey: "SearchTexts")
        }
    }

    init() {
        self.groupNames = UserDefaults.standard.array(forKey: "GroupNames") as? [String] ?? []
        self.searchTexts = UserDefaults.standard.array(forKey: "SearchTexts") as? [String] ?? []
    }

    // Add a method to save a new group name and search text
    func saveGroupName(_ groupName: String, searchText: String) {
        groupNames.append(groupName)
        searchTexts.append(searchText)
    }
}
