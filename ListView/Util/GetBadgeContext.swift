//
//  GetBadgeContext.swift
//  Hugo
//
//  Created by Hugooooo on 10/19/23.
//

import Foundation

func getHobby(dukePerson: DukePerson) -> Icon {
    if let hobby = dukePerson.hobby?.lowercased() {
        if hobby.contains("golf") {
            return Icon.Golf
        } else if hobby.contains("swim") {
            return Icon.Swimming
        } else if hobby.contains("game") || hobby.contains("video") {
            return Icon.Game
        } else if hobby.contains("badmin") {
            return Icon.Badminton
        } else if hobby.contains("sing") || hobby.contains("rap") || hobby.contains("song") {
            return Icon.Singing
        } else if hobby.contains("music") {
            return Icon.Music
        } else if hobby.contains("gym") || hobby.contains("exercise"){
            return Icon.Gym
        } else if hobby.contains("cook") || hobby.contains("baking"){
            return Icon.Cooking
        } else if hobby.contains("movie") || hobby.contains("watch") {
            return Icon.Movie
        } else if hobby.contains("hik") {
            return Icon.Hiking
        } else {
            return Icon.Sports
        }
    } else {
        return Icon.Sports
    }
}

func getLanguage(dukePerson: DukePerson) -> Icon {
    let lan = dukePerson.languages!.joined(separator: ", ").lowercased()
    if lan.contains("javascript") {
        return Icon.JavaScript
    } else if lan.contains("python") {
        return Icon.Python
    } else if lan.contains("c+") {
        return Icon.CPlus
    } else if lan.contains("java") {
        return Icon.Java
    } else if lan.contains("swift") {
        return Icon.Swift
    } else if lan.contains("c") {
        return Icon.C
    } else {
        return Icon.Languages
    }
}

func getAnotherLanguage(dukePerson: DukePerson, firstLanguage: Icon) -> Icon {
    let lan = dukePerson.languages!.joined(separator: ", ").lowercased().replacing(firstLanguage.rawValue.lowercased(), with: "")
    if lan.contains("javascript") {
        return Icon.JavaScript
    } else if lan.contains("python") {
        return Icon.Python
    } else if lan.contains("c+") {
        return Icon.CPlus
    } else if lan.contains("java") {
        return Icon.Java
    } else if lan.contains("swift") {
        return Icon.Swift
    } else if lan.contains("c") {
        return Icon.C
    } else {
        return Icon.Languages
    }
}
