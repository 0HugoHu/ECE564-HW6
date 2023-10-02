//
//  DataStructures.swift
//  DukePeople
//
//  Created by Hugooooo on 9/5/23.
//

import Foundation

enum Role : String, Codable {
    case Unknown = "Unknown" // has not been specified
    case Professor = "Professor"
    case TA = "TA"
    case Student = "Student"
    case Other = "Other" // has been specified, but is not Professor, TA, or Student
    
    // Custom initializer for decoder
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self)
        
        switch rawValue {
        case "Unknown":
            self = .Unknown
        case "Professor":
            self = .Professor
        case "TA":
            self = .TA
        case "Student":
            self = .Student
        default:
            self = .Other
        }
    }
}


enum Gender : String, Codable {
    case Unknown = "Unknown" // has not been specified
    case Male = "Male"
    case Female = "Female"
    case Other = "Other" // has been specified, but is not “Male” or “Female”
    
    // Custom initializer for decoder
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self)
        
        switch rawValue {
        case "Unknown":
            self = .Unknown
        case "Male":
            self = .Male
        case "Female":
            self = .Female
        default:
            self = .Other
        }
    }
}
