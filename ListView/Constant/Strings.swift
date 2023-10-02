//
//  Strings.swift
//  DukePeople
//
//  Created by Hugooooo on 9/6/23.
//

import Foundation

let sandboxURL: URL = getDocumentsDirectory()

let helpText = """
            --------------------------------------- Help ---------------------------------------
            Format:
            fn=first_name, ln=last_name, em=email,
            ro=role, ge=gender, fr=from
            - ro must be one of: Student, TA, Professor, Staff, or will be Other
            - ge must be one of: Male, Female, otherwise will be Other
            - Either of these parameters must not contains ',', space, or '='
            - The order of parameters does not matter
            
            1. Add: Add a person to the database.
                DUID is required, all other parameters are optional.
            2. Update: Update or add a person with given DUID.
                DUID is required, all other parameters are optional.
            3. Delete: Delete a person with given DUID.
                DUID is required, all other parameters are ignored.
            4. Find: Find a person with given DUID or given name.
                Either DUID or lName is required, fName is default with "*".
                Use "*" to represent any name. Not case sensitive.
            5. List All: List all people in the database.
            6. Help: Show this help message.
            
            CopyRight: Yadong (Hugo) Hu, 2023
            --------------------------------------------------------------------------------------\n
            """

let url = "http://ece564.rc.duke.edu:8080/entries"

let uploadHelpText = """
                -- Initial Upload --
                Upload your data to the server from the build-in JSON file
                
                -- Updated Upload --
                Update your remote profile with your local changes
                """

let downloadHelpText = """
                -- Download Replace --
                Clear your local data model, and fetch the entire records from the server
                
                -- Download Update --
                Merge your local data model with remote data
                
                -- Replace One Only --
                Replace your local specific one's profile with remote one
                """

let othersHelpText = """
                -- Load from Disk --
                Discard all data in memory, and sysnc with local sandbox's data
                
                -- Delete Myself --
                Delete your profile from the server
                """


let DUID = 1177060
let netID = "yh342"

let authString = "yh342:d50fdd0e33cd121a55dfe22b87085a8297511caac2e6b2e82d89e3c5da68faa7"

let junkString = "asdowapegonapwoiengpoiwnpoiawnepofnawpoienfopiwaemfoiwamepfoiwnpgoiw"

let JSONName = "dukePersonDict.json"


//let base64ImageT = GetImageBase64(imageName: "Test").getBase64Image()
let jsonDictionary: [String: Any] = [
    "DUID": DUID,
    "netid": "yh342",
    "fName": "Hugo",
    "lName": "Hu",
    "from": "Durham, NC",
    "gender": "Other",
    "role": "Student",
    "program": "Master of Engineering",
    "plan": "Electric and Computer Engineering",
    "team": "Janus and Minghui",
    "movie": "Harry Potter",
    "hobby": "Fishing, Photography, Lego©, Badminton, Swiming, Coding",
    "languages": ["Java", "C++", "Rust", "Kotlin", "Python"],
    "email": "grad@hugohu.top",
    "description": "N/A",
    "picture": "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"
]
