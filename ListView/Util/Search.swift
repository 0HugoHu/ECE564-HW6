//
//  Search.swift
//  Hugo
//
//  Created by Hugooooo on 9/30/23.
//

import Foundation


func filterByFieldSearch(_ searchStr: String, _ peopleList: [DukePerson]) -> [DukePerson] {
    return peopleList.filter { person in
        let components = searchStr.components(separatedBy: "=")
        if components.count == 2 {
            let (key, value) = (components[0], components[1])
            switch key {
            case "id":
                if let id = Int(value), id != person.DUID {
                    return false
                }
            case "netid":
                if person.netid?.lowercased() != value.lowercased() {
                    return false
                }
            case "fn":
                if person.fName.lowercased() != value.lowercased() {
                    return false
                }
            case "ln":
                if person.lName.lowercased() != value.lowercased() {
                    return false
                }
            case "em":
                if person.email.lowercased() != value.lowercased() {
                    return false
                }
            case "fr":
                if person.from.lowercased() != value.lowercased() {
                    return false
                }
            case "ge":
                if person.gender.rawValue.lowercased() != value.lowercased() {
                    return false
                }
            case "ro":
                if person.role.rawValue.lowercased() != value.lowercased() {
                    return false
                }
            case "pr":
                if person.program.lowercased() != value.lowercased() {
                    return false
                }
            case "pl":
                if person.plan.lowercased() != value.lowercased() {
                    return false
                }
            case "ho":
                if let hobby = person.hobby, !hobby.lowercased().contains(value.lowercased()) {
                    return false
                }
            case "la":
                if let languages = person.languages, !languages.contains(where: { $0.lowercased() == value.lowercased() }) {
                    return false
                }
            case "mo":
                if let movie = person.movie, !movie.lowercased().contains(value.lowercased()) {
                    return false
                }
            case "te":
                if let team = person.team, !team.lowercased().contains(value.lowercased()) {
                    return false
                }
            case "pi":
                if person.picture.lowercased() != value.lowercased() {
                    return false
                }
            case "desc":
                if !person.description.contains(value) {
                    return false
                }
            default:
                return false
            }
            
        }
        return true
    }
}


func filterByRole(_ role: Role, _ searchText: String, _ peopleList: [DukePerson], _ isRegexSearch: Bool, _ isFieldSearch: Bool) -> [DukePerson] {
    let newPeopleList = peopleList.filter { $0.role == role }
    if searchText.isEmpty {
        return newPeopleList
    } else if isFieldSearch {
        return filterByFieldSearch(searchText, newPeopleList)
    } else {
        let searchPattern = isRegexSearch ? searchText : NSRegularExpression.escapedPattern(for: searchText)
        let regexOptions: NSRegularExpression.Options = isRegexSearch ? [] : [.caseInsensitive]
        
        do {
            let regex = try NSRegularExpression(pattern: searchPattern, options: regexOptions)
            
            return newPeopleList.filter { person in
                let description = person.description
                let range = NSRange(location: 0, length: description.utf16.count)
                return regex.firstMatch(in: description, options: [], range: range) != nil
            }
        } catch {
            print("Invalid regular expression: \(error.localizedDescription)")
            return []
        }
    }
}


func filterBySearch(_ searchText: String, _ peopleList: [DukePerson]) -> [DukePerson] {
    let searchPairs = searchText.components(separatedBy: ",")
    
    return peopleList.filter { person in
        return searchPairs.allSatisfy { searchPair in
            let components = searchPair.components(separatedBy: "=")
            if components.count == 2 {
                let (key, value) = (components[0].trimmingCharacters(in: .whitespacesAndNewlines), components[1].trimmingCharacters(in: .whitespacesAndNewlines))
                switch key {
                case "id":
                    if let id = Int(value), id != person.DUID {
                        return false
                    }
                case "netid":
                    if let netid = person.netid, !netid.lowercased().contains(value.lowercased()) {
                        return false
                    }
                case "fn":
                    if !person.fName.lowercased().contains(value.lowercased()) {
                        return false
                    }
                case "ln":
                    if !person.lName.lowercased().contains(value.lowercased()) {
                        return false
                    }
                case "em":
                    if !person.email.lowercased().contains(value.lowercased()) {
                        return false
                    }
                case "fr":
                    if !person.from.lowercased().contains(value.lowercased()) {
                        return false
                    }
                case "ge":
                    if !person.gender.rawValue.lowercased().contains(value.lowercased()) {
                        return false
                    }
                case "ro":
                    if !person.role.rawValue.lowercased().contains(value.lowercased()) {
                        return false
                    }
                case "pr":
                    if !person.program.lowercased().contains(value.lowercased()) {
                        return false
                    }
                case "pl":
                    if !person.plan.lowercased().contains(value.lowercased()) {
                        return false
                    }
                case "ho":
                    if let hobby = person.hobby, !hobby.lowercased().contains(value.lowercased()) {
                        return false
                    }
                case "la":
                    if let languages = person.languages, !languages.contains(where: { $0.lowercased().contains(value.lowercased()) }) {
                        return false
                    }
                case "mo":
                    if let movie = person.movie, !movie.lowercased().contains(value.lowercased()) {
                        return false
                    }
                case "te":
                    if let team = person.team, !team.lowercased().contains(value.lowercased()) {
                        return false
                    }
                case "desc":
                    if !person.description.lowercased().contains(value.lowercased()) {
                        return false
                    }
                default:
                    return false
                }
            }
            return true
        }
    }
}
