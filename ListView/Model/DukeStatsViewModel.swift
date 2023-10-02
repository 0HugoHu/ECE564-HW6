//
//  DukeStatsViewModel.swift
//  Hugo
//
//  Created by Hugooooo on 10/1/23.
//

import Foundation

struct ChartData: Identifiable {
    let id = UUID()
    let key: String
    let value: Double
}

class DukeStatsViewModel: ObservableObject {
    var dataModel: [DukePerson] = []
    
    init(dataModel: [DukePerson]) {
        self.dataModel = dataModel
    }
    
    var totalPeople: Int {
        return dataModel.count
    }
    
    
    var totalProfessors: Int {
        return dataModel.filter { $0.role == .Professor }.count
    }
    
    
    var totalTAs: Int {
        return dataModel.filter { $0.role == .TA }.count
    }
    
    
    var totalStudents: Int {
        return dataModel.filter { $0.role == .Student }.count
    }
    
    var genders: [String: Int] {
        let genderCounts = dataModel.reduce(into: [String: Int]()) { (result, person) in
            let genderName = person.gender.rawValue
            result[genderName, default: 0] += 1
        }
        return genderCounts
    }
    
    var programs: [String: Int] {
        let programCounts = dataModel.reduce(into: [String: Int]()) { (result, person) in
            let programName = person.program
            result[programName, default: 0] += 1
        }
        return programCounts
    }
    
    var plans: [String: Int] {
        let planCounts = dataModel.reduce(into: [String: Int]()) { (result, person) in
            let planName = person.plan
            result[planName, default: 0] += 1
        }
        return planCounts
    }
    
    
    var froms: [String: Int] {
        let fromCounts = dataModel.reduce(into: [String: Int]()) { (result, person) in
            let fromName = person.from
            result[fromName, default: 0] += 1
        }
        return fromCounts
    }
    
    

    var totalImageSize: String {
        let totalSizeInBytes = dataModel.reduce(0) { $0 + $1.picture.count }
        
        if totalSizeInBytes < 1000 {
            return "\(totalSizeInBytes) B"
        } else if totalSizeInBytes < 1000000 {
            let totalSizeInKB = Double(totalSizeInBytes) / 1000.0
            return String(format: "%.2f KB", totalSizeInKB)
        } else {
            let totalSizeInMB = Double(totalSizeInBytes) / 1000000.0
            return String(format: "%.2f MB", totalSizeInMB)
        }
    }


    var largestImageSizeOwner: String {
        // Calculate the owner with the largest image size
        guard let person = dataModel.max(by: { $0.picture.count < $1.picture.count }) else {
            return "N/A"
        }
        let totalSizeInKB = Double(person.picture.count) / 1000.0
        return "\(String(format: "%.2f KB", totalSizeInKB))$\(person.fName) \(person.lName)"
    }

    var smallestImageSizeOwner: String {
        // Calculate the owner with the smallest image size
        guard let person = dataModel.min(by: { $0.picture.count < $1.picture.count }) else {
            return "N/A"
        }
        let totalSizeInKB = Double(person.picture.count) / 1000.0
        return "\(String(format: "%.2f KB", totalSizeInKB))$\(person.fName) \(person.lName)"
    }

    var mostHobbiesOwner: String {
        // Calculate the owner with the most hobbies
        guard let person = dataModel.max(by: { ($0.hobby?.components(separatedBy: ",").count ?? 0) < ($1.hobby?.components(separatedBy: ",").count ?? 0) }) else {
            return "N/A"
        }
        let hobbyCount = person.hobby?.components(separatedBy: ",").count ?? 0
        return "\(hobbyCount)$\(person.hobby ?? "")$\(person.fName) \(person.lName)"
    }

    var mostLanguagesOwner: String {
        // Calculate the owner with the most languages
        guard let person = dataModel.max(by: { ($0.languages?.count ?? 0) < ($1.languages?.count ?? 0) }) else {
            return "N/A"
        }
        let languageCount = person.languages?.count ?? 0
        let languages = person.languages?.joined(separator: ", ") ?? ""
        return "\(languageCount)$\(languages)$\(person.fName) \(person.lName)"
    }
}
