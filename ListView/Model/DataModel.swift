//
//  DataModel.swift
//  DukePeople
//
//  Created by Hugooooo on 9/5/23.
//

import Foundation
import UIKit
import SwiftUI

// Duke Person Data Model
struct DukePerson : CustomStringConvertible, Codable {
    let DUID: Int
    var netid: String?
    var fName: String
    var lName: String
    var email: String
    var from: String
    var gender: Gender
    var role: Role
    var program: String
    var plan: String
    var hobby: String?
    var languages: [String]?
    var movie: String?
    var team: String?
    var picture: String
    
    
    // Custom description
    var description: String {
        let pronoun: (subject: String, object: String)
        switch gender {
        case .Male:
            pronoun = ("He", "Him")
        case .Female:
            pronoun = ("She", "Her")
        default:
            pronoun = ("They", "Them")
        }
        
        var additionalInfo = ""
        
        additionalInfo += " \(pronoun.subject) loves \(hobby ?? "??") as a hobby. "
        
        additionalInfo += " \(pronoun.subject) enjoys watching \(movie ?? "??") as a favorite movie. "
        
        if !languages!.isEmpty {
            additionalInfo += " \(pronoun.subject) is proficient in \(languages!.joined(separator: ", "))."
        } else {
            additionalInfo += " \(pronoun.subject) is proficient in ?? languages."
        }
        
        if role == .Student {
            return "\(fName) \(lName) is a Student. \(pronoun.subject) is in the \(program) program working towards a \(plan) degree. \(additionalInfo) You can reach \(pronoun.object.lowercased()) at \(email)."
        } else {
            return "\(fName) \(lName) is a \(role). \(pronoun.subject) is from \(from). \(additionalInfo) You can reach \(pronoun.object.lowercased()) at \(email)."
        }
    }
    
    init(DUID: Int, fName: String, lName: String, email: String, from: String, gender: Gender, role: Role) {
        self.DUID = DUID
        self.fName = fName
        self.lName = lName
        self.email = email
        self.from = from
        self.gender = gender
        self.role = role
        self.program = "??"
        self.plan = "??"
        self.picture = "??"
        self.hobby = "??"
        self.languages = [String]()
        self.movie = "??"
        self.team = "??"
        self.netid = "??"
    }
    
    init(DUID: Int, fName: String, lName: String, email: String, from: String, gender: Gender, role: Role, program: String, plan: String, picture: String) {
        self.DUID = DUID
        self.fName = fName
        self.lName = lName
        self.email = email
        self.from = from
        self.gender = gender
        self.role = role
        self.program = program
        self.plan = plan
        self.picture = picture
        self.hobby = "??"
        self.languages = [String]()
        self.movie = "??"
        self.team = "??"
        self.netid = "??"
    }
    
    init(DUID: Int, netid: String, fName: String, lName: String, email: String, from: String, gender: Gender, role: Role, program: String, plan: String, picture: String, hobby: String, languages: [String], movie: String, team: String) {
        self.DUID = DUID
        self.fName = fName
        self.lName = lName
        self.email = email
        self.from = from
        self.gender = gender
        self.role = role
        self.program = program
        self.plan = plan
        self.picture = picture
        self.hobby = hobby
        self.languages = languages
        self.movie = movie
        self.team = team
        self.netid = netid
    }
}


// Duke Person Dictionary
class DukePersonDict : NSObject, URLSessionDownloadDelegate, ObservableObject {
    
    // A dictionary to store DukePerson objects
    @Published var people: [Int : DukePerson]
    @Published var downloadProgress: Double = 0.0
    @Published var isDownloading: Bool = false
    
    var url: URL
    var errorFlag: Bool = true
    var errorMessage = ""
    var replaceFlag = true
    var replaceDUIDFlag = false
    
    
    private lazy var urlSession: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config, delegate: self, delegateQueue: nil)
    }()
    
    
    init(url: URL = sandboxURL.appendingPathComponent(JSONName)) {
        self.people = [Int : DukePerson]()
        self.url = url
        super.init()
        
        if !load(url) {
            print("Unable to load data from \(url)")
        } else {
            if !save() {
                print("Unable to save data to \(url)")
            }
        }
        print("Loaded \(people.count) people")
    }
    
    
    /*
     If the "newPerson.DUID" is not already in the database, add newPerson to the
     database and return true. Otherwise return false.
     */
    func add(_ newPerson: DukePerson) -> Bool {
        if people[newPerson.DUID] != nil {
            return false
        }
        people[newPerson.DUID] = newPerson
        return true
    }
    
    
    /*
     Looks for the "updatedPerson.DUID" in the database. If found, replaces that entry, and returns
     true. If not found, then adds "updatedPerson" to database and returns false.
     */
    func update(_ updatedPerson: DukePerson) -> Bool {
        let existingPerson = people[updatedPerson.DUID] != nil
        if !existingPerson {
            people[updatedPerson.DUID] = updatedPerson
            return false
        }
        // Update properties based on non-nil and non-empty values in updatedPerson
        if !updatedPerson.fName.isEmpty {
            people[updatedPerson.DUID]!.fName = updatedPerson.fName
        }
        
        if !updatedPerson.lName.isEmpty {
            people[updatedPerson.DUID]!.lName = updatedPerson.lName
        }
        
        if !updatedPerson.email.isEmpty {
            people[updatedPerson.DUID]!.email = updatedPerson.email
        }
        
        if !updatedPerson.from.isEmpty {
            people[updatedPerson.DUID]!.from = updatedPerson.from
        }
        
        if updatedPerson.gender != .Unknown {
            people[updatedPerson.DUID]!.gender = updatedPerson.gender
        }
        
        if updatedPerson.role != .Unknown {
            people[updatedPerson.DUID]!.role = updatedPerson.role
        }
        
        return true
    }
    
    
    /*
     Looks for "DUID" entry in database. If found, remove the entry from the
     database and return true. If not found, return false.
     */
    func delete(_ DUID: Int) -> Bool {
        if people[DUID] == nil {
            return false
        }
        people.removeValue(forKey: DUID)
        return true
    }
    
    
    /*
     Searches for an entry with "DUID". If found, returns the info as an Optional DukePerson.
     If not found, returns nil.
     */
    func find(_ DUID: Int) -> DukePerson? {
        return people[DUID]
    }
    
    
    /*
     Finds all the people in the database that match the given lastName and firstName.
     The firstName parameter is defaulted, so you can also call the method with just the lastName.
     If “*” is specified for both lastName and firstName, return everyone in the database.
     If no matches found, returns nil
     */
    func find(lastName lName: String, firstName fName: String = "*") -> [DukePerson]? {
        if lName == "*" && fName == "*" {
            // Return everyone in the dictionary
            return Array(people.values)
        } else {
            // Find people based on lastName and firstName
            let filteredPeople = people.values.filter { person in
                if lName == "*" {
                    return person.fName.lowercased() == fName.lowercased()
                } else if fName == "*" {
                    return person.lName.lowercased() == lName.lowercased()
                } else {
                    return person.lName.lowercased() == lName.lowercased() && person.fName.lowercased() == fName.lowercased()
                }
            }
            
            if filteredPeople.isEmpty {
                return nil
            } else {
                return Array(filteredPeople)
            }
        }
    }
    
    
    /*
     Returns a formatted list of all entries in the database,
     for example “1. Ric Telford, Professor, ric.telford@duke.edu – 0664541”
     */
    func list() -> String {
        var result = ""
        for (index, person) in people.values.enumerated() {
            result += "\(index + 1). \(person.fName) \(person.lName), \(person.role.rawValue), \(person.email) – \(person.DUID)\n"
        }
        return result
    }
    
    
    /*
     Reads a JSON file as designated by url, decodes it, and replaces the existing
     data model with the entries from the JSON file. Returns true if everything worked OK,
     false if it doesn’t.
     */
    func load(_ url: URL) -> Bool {
        do {
            let fileManager = FileManager.default
            let data: Data
            if fileManager.fileExists(atPath: url.path) {
                // Load data from the JSON file if it exists
                data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                self.people = try decoder.decode([Int: DukePerson].self, from: data)
                return true
            } else {
                // Load data from an asset file if the JSON file does not exist
                let dukePerson = DukePerson(
                    DUID: jsonDictionary["DUID"] as! Int,
                    netid: jsonDictionary["netid"] as! String,
                    fName: jsonDictionary["fName"] as! String,
                    lName: jsonDictionary["lName"] as! String,
                    email: jsonDictionary["email"] as! String,
                    from: jsonDictionary["from"] as! String,
                    gender: Gender(rawValue: jsonDictionary["gender"] as! String) ?? .Unknown,
                    role: Role(rawValue: jsonDictionary["role"] as! String) ?? .Unknown,
                    program: jsonDictionary["program"] as! String,
                    plan: jsonDictionary["plan"] as! String,
                    picture: jsonDictionary["picture"] as! String,
                    hobby: jsonDictionary["hobby"] as! String,
                    languages: jsonDictionary["languages"] as! [String],
                    movie: jsonDictionary["movie"] as! String,
                    team: jsonDictionary["team"] as! String
                )
                self.people[dukePerson.DUID] = dukePerson
                return true
            }
        } catch {
            return false
        }
    }
    
    
    /*
     Converts the current data model entries to JSON and writes the JSON string to a pre-determined filename.
     Returns true if everything works OK, false if it doesn’t.
     */
    func save() -> Bool {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(self.people)
            try data.write(to: self.url)
            return true
        } catch {
            print("Error saving data: \(error)")
            return false
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        if let d = try? Data(contentsOf: location) {
            do {
                let decoder = JSONDecoder()
                var dukePeopleArray = try decoder.decode([DukePerson].self, from: d)
                
                for i in 0..<dukePeopleArray.count {
                    if dukePeopleArray[i].hobby == nil {
                        dukePeopleArray[i].hobby = "??"
                    }
                    if dukePeopleArray[i].languages == nil {
                        dukePeopleArray[i].languages = [String]()
                    }
                    if dukePeopleArray[i].team == nil {
                        dukePeopleArray[i].team = "??"
                    }
                    if dukePeopleArray[i].movie == nil {
                        dukePeopleArray[i].movie = "??"
                    }
                    if dukePeopleArray[i].netid == nil {
                        dukePeopleArray[i].netid = "??"
                    }
                    dukePeopleArray[i].email.replace("‎ ", with: "")
                }
                DispatchQueue.main.async {
                    for dukePerson in dukePeopleArray {
                        self.people[dukePerson.DUID] = dukePerson
                    }
                    self.errorFlag = false
                    self.downloadProgress = 0.0
                }
            } catch {
                self.errorFlag = true
                self.errorMessage = "Error Decoding from Asset!"
            }
        } else {
            self.errorFlag = true
            self.errorMessage = "Error Downloading to Asset!"
        }
        self.replaceDUIDFlag = false;
        DispatchQueue.main.async {
            self.isDownloading = false
            if self.save() {}
        }
    }
    
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        DispatchQueue.main.async {
            self.downloadProgress = Double(totalBytesWritten)/Double(totalBytesExpectedToWrite)
        }
    }
    
    func reset() -> Bool {
        self.people = [:]
        if !load(url) {
            print("Unable to load data from \(url)")
            return false
        } else {
            if !save() {
                print("Unable to save data to \(url)")
                return false
            }
        }
        return true
    }
    
    
    /*
     Uploads the data model to the specified website.
     */
    //    func upload(website: String, auth: String, update: Bool) -> Bool {
    //        self.errorFlag = false
    //        let urlString = website + (update ? "/\(netID)" : "/create")
    //        guard let url = URL(string: urlString) else {
    //            errorFlag = true
    //            errorMessage = "Invalid URL!"
    //            return false
    //        }
    //
    //        var request = URLRequest(url: url)
    //        request.httpMethod = update ? "PUT" : "POST"
    //
    //        // Set the HTTP header for Authorization
    //        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    //        let base64Auth = auth.data(using: .utf8)!.base64EncodedString()
    //        let authValue = "Basic \(base64Auth)"
    //        request.setValue(authValue, forHTTPHeaderField: "Authorization")
    //
    //        do {
    //            let jsonData: Data
    //            if update {
    //                // Use data model stored in memory
    //                jsonData = try JSONEncoder().encode(dataModel.find(DUID)!)
    //            } else {
    //                // Use default dictionary defined in Strings.swift
    //                jsonData = try JSONSerialization.data(withJSONObject: jsonDictionary, options: [])
    //            }
    //
    //            request.httpBody = jsonData
    //
    //            let httpTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
    //                DispatchQueue.main.async {
    //                    if let error = error {
    //                        self.errorFlag = true
    //                        self.errorMessage = "Error creating POST or PUT request: \(error)"
    //                        self.statusLabel.text = self.errorMessage
    //                    } else if let httpResponse = response as? HTTPURLResponse {
    //                        if httpResponse.statusCode == 200 {
    //                            self.errorFlag = false
    //                            self.statusLabel.text = "Upload Complete!"
    //                        } else {
    //                            self.errorFlag = true
    //                            self.errorMessage = "Upload response error: \(httpResponse.statusCode)"
    //                            self.statusLabel.text = self.errorMessage
    //                        }
    //                    }
    //                }
    //            }
    //            httpTask.resume()
    //        } catch {
    //            DispatchQueue.main.async {
    //                self.errorFlag = true
    //                self.errorMessage = "Error encoding JSON data: \(error)"
    //                self.statusLabel.text = self.errorMessage
    //            }
    //        }
    //
    //        return !self.errorFlag
    //    }
    
    
    /*
     Downloads the data model from the specified website.
     */
    func download(website: String, auth: String) -> Bool {
        self.isDownloading = true
        self.errorFlag = false
        let url = URL(string: website + "/all")
        var req = URLRequest(url: url!)
        req.httpMethod = "GET"
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let base64Auth = auth.data(using: .utf8)!.base64EncodedString()
        let authValue = "Basic \(base64Auth)"
        req.setValue(authValue, forHTTPHeaderField: "Authorization")
        
        let task = urlSession.downloadTask(with: req)
        task.resume()
        
        return !self.errorFlag
    }
    
    
    /*
     Deletes your DukePerson information from the server.
     */
    //    func delete(website: String, auth: String) -> Bool {
    //        self.errorFlag = false
    //        let url = URL(string: website + "/\(netID)")
    //        var req = URLRequest(url: url!)
    //        req.httpMethod = "DELETE"
    //        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
    //        let base64Auth = auth.data(using: .utf8)!.base64EncodedString()
    //        let authValue = "Basic \(base64Auth)"
    //        req.setValue(authValue, forHTTPHeaderField: "Authorization")
    //        let httpTask = URLSession.shared.dataTask(with: req) { (data, response, error) in
    //            DispatchQueue.main.async {
    //                if let error = error {
    //                    self.errorFlag = true
    //                    self.errorMessage = "Error creating DELETE request: \(error)"
    //                    self.statusLabel.text = self.errorMessage
    //                } else if let httpResponse = response as? HTTPURLResponse {
    //                    if httpResponse.statusCode == 200 {
    //                        self.errorFlag = false
    //                        self.statusLabel.text = "Deleted Complete!"
    //                    } else {
    //                        self.errorFlag = true
    //                        self.errorMessage = "Delete Response error: \(httpResponse.statusCode)"
    //                        self.statusLabel.text = self.errorMessage
    //                    }
    //                }
    //            }
    //        }
    //        httpTask.resume()
    //
    //        return !self.errorFlag
    //    }
    
}

