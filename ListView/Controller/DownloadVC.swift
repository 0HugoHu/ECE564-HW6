//
//  DownloadVC.swift
//  Hugo
//
//  Created by Hugooooo on 9/19/23.
//

import Foundation
import UIKit

class DownloadVC: UIViewController, URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        DispatchQueue.main.async {
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
                    if self.replaceDUIDFlag {
                        // Only replace given person
                        var found = false
                        for dukePerson in dukePeopleArray {
                            if dukePerson.DUID == self.DUIDInput {
                                self.dataModel.people[dukePerson.DUID] = dukePerson
                                found = true
                                break
                            }
                        }
                        if !found {
                            self.errorFlag = true
                            self.errorMessage = "No DUID \(String(describing: self.DUIDInput)) Found!"
                            self.statusLabel.text = self.errorMessage
                        }
                    } else {
                        if self.replaceFlag {
                            // Erase all
                            self.dataModel.people = [:]
                        }
                        for dukePerson in dukePeopleArray {
                            self.dataModel.people[dukePerson.DUID] = dukePerson
                        }
                    }
                    self.errorFlag = false
                } catch {
                    self.errorFlag = true
                    self.errorMessage = "Error Decoding from Asset!"
                    self.statusLabel.text = self.errorMessage
                }
            } else {
                self.errorFlag = true
                self.errorMessage = "Error Downloading to Asset!"
                self.statusLabel.text = self.errorMessage
            }
            self.replaceDUIDFlag = false;
        }
    }
    
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let t = "Downloading...  \(100*totalBytesWritten/totalBytesExpectedToWrite)%"
        DispatchQueue.main.async {
            self.statusLabel.text = t
            self.progressBar.progress = Float(totalBytesWritten)/Float(totalBytesExpectedToWrite)
            if self.progressBar.progress == 1 {
                self.errorFlag = false
                self.statusLabel.text = "Download Complete!"
            }
        }
    }
    
    
    @IBAction func initUploadBtn(_ sender: Any) {
        if upload(website: url, auth: authString, update: false) {}
    }
    
    
    @IBAction func updateUploadBtn(_ sender: Any) {
        if upload(website: url, auth: authString, update: true) {}
    }
    
    
    @IBAction func downloadReplaceBtn(_ sender: Any) {
        replaceFlag = true
        if download(website: url, auth: authString) {
            if self.dataModel.save() {}
        }
    }
    
    
    @IBAction func downloadUpdateBtn(_ sender: Any) {
        replaceFlag = false
        if download(website: url, auth: authString) {
            if self.dataModel.save() {}
        }
    }
    
    
    @IBAction func loadDiskBtn(_ sender: Any) {
        // Re-initialize data
        dataModel = DukePersonDict(url: sandboxURL.appendingPathComponent(JSONName))
        if dataModel.people.count > 0 {
            self.statusLabel.text = "Load from Disk Complete!"
            errorFlag = false
        }
    }
    
    
    @IBAction func deleteBtn(_ sender: Any) {
        if delete(website: url, auth: authString) {}
    }
    
    
    @IBOutlet weak var DUIDTextFieldIn: UITextField!
    @IBAction func DUIDTextField(_ sender: Any) {
        if let text = DUIDTextFieldIn.text, let duid = Int(text) {
            DUIDInput = duid
        } else {
            self.errorMessage = "Invalid DUID!"
            self.statusLabel.text = self.errorMessage
            DUIDInput = nil
        }
    }
    
    
    @IBAction func DUIDDownloadBtn(_ sender: Any) {
        if DUIDInput != nil {
            replaceFlag = true
            replaceDUIDFlag = true
            if download(website: url, auth: authString) {
                self.statusLabel.text = "Download \(String(describing: DUIDInput)) Complete!"
                if self.dataModel.save() {}
            }
        } else {
            self.errorMessage = "Invalid DUID!"
            self.statusLabel.text = self.errorMessage
        }
    }
    
    
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var statusLabel: UILabel!
    
    var errorFlag: Bool = true
    var errorMessage = ""
    var replaceFlag = true
    var replaceDUIDFlag = false
    var DUIDInput : Int?
    var dataModel = DukePersonDict(url: sandboxURL.appendingPathComponent(JSONName))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        addGradientBackground(to: self.gradientView, fromColor: blueColorDownloadVC, toColor: redColorDownloadVC)
    }
    
    
    /*
     Uploads the data model to the specified website.
     */
    func upload(website: String, auth: String, update: Bool) -> Bool {
        self.errorFlag = false
        let urlString = website + (update ? "/\(netID)" : "/create")
        guard let url = URL(string: urlString) else {
            errorFlag = true
            errorMessage = "Invalid URL!"
            self.statusLabel.text = self.errorMessage
            return false
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = update ? "PUT" : "POST"
        
        // Set the HTTP header for Authorization
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let base64Auth = auth.data(using: .utf8)!.base64EncodedString()
        let authValue = "Basic \(base64Auth)"
        request.setValue(authValue, forHTTPHeaderField: "Authorization")
        
        do {
            let jsonData: Data
            if update {
                // Use data model stored in memory
                jsonData = try JSONEncoder().encode(dataModel.find(DUID)!)
            } else {
                // Use default dictionary defined in Strings.swift
                jsonData = try JSONSerialization.data(withJSONObject: jsonDictionary, options: [])
            }
            
            request.httpBody = jsonData
            
            let httpTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
                DispatchQueue.main.async {
                    if let error = error {
                        self.errorFlag = true
                        self.errorMessage = "Error creating POST or PUT request: \(error)"
                        self.statusLabel.text = self.errorMessage
                    } else if let httpResponse = response as? HTTPURLResponse {
                        if httpResponse.statusCode == 200 {
                            self.errorFlag = false
                            self.statusLabel.text = "Upload Complete!"
                        } else {
                            self.errorFlag = true
                            self.errorMessage = "Upload response error: \(httpResponse.statusCode)"
                            self.statusLabel.text = self.errorMessage
                        }
                    }
                }
            }
            httpTask.resume()
        } catch {
            DispatchQueue.main.async {
                self.errorFlag = true
                self.errorMessage = "Error encoding JSON data: \(error)"
                self.statusLabel.text = self.errorMessage
            }
        }
        
        return !self.errorFlag
    }
    
    
    /*
     Downloads the data model from the specified website.
     */
    func download(website: String, auth: String) -> Bool {
        self.errorFlag = false
        let url = URL(string: website + "/all")
        let session : URLSession = {
            let config = URLSessionConfiguration.ephemeral
            config.allowsCellularAccess = false
            let session = URLSession(configuration: config, delegate: self, delegateQueue: .main)
            return session
        }()
        var req = URLRequest(url: url!)
        req.httpMethod = "GET"
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let base64Auth = auth.data(using: .utf8)!.base64EncodedString()
        let authValue = "Basic \(base64Auth)"
        req.setValue(authValue, forHTTPHeaderField: "Authorization")
        
        let task = session.downloadTask(with: req)
        task.resume()
        
        
        
        return !self.errorFlag
    }
    
    
    /*
     Deletes your DukePerson information from the server.
     */
    func delete(website: String, auth: String) -> Bool {
        self.errorFlag = false
        let url = URL(string: website + "/\(netID)")
        var req = URLRequest(url: url!)
        req.httpMethod = "DELETE"
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let base64Auth = auth.data(using: .utf8)!.base64EncodedString()
        let authValue = "Basic \(base64Auth)"
        req.setValue(authValue, forHTTPHeaderField: "Authorization")
        let httpTask = URLSession.shared.dataTask(with: req) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    self.errorFlag = true
                    self.errorMessage = "Error creating DELETE request: \(error)"
                    self.statusLabel.text = self.errorMessage
                } else if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 200 {
                        self.errorFlag = false
                        self.statusLabel.text = "Deleted Complete!"
                    } else {
                        self.errorFlag = true
                        self.errorMessage = "Delete Response error: \(httpResponse.statusCode)"
                        self.statusLabel.text = self.errorMessage
                    }
                }
            }
        }
        httpTask.resume()
        
        return !self.errorFlag
    }
    
}
