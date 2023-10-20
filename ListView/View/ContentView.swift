//
//  ContentView.swift
//  ListView
//
//  Created by Hugooooo on 9/28/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var dataModel = DukePersonDict()
    @State private var selection: Tab = .list
    
    enum Tab {
        case list
        case stats
        case group
    }
    
    var body: some View {
        TabView(selection: $selection) {
            DukePeopleList()
                .environmentObject(dataModel)
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        
            GroupView()
                .environmentObject(dataModel)
                .tabItem {
                    Label("Groups", systemImage: "person.2")
                }
                .tag(Tab.group)
            
            StatsView()
                .environmentObject(dataModel)
                .tabItem {
                    Label("Stats", systemImage: "chart.dots.scatter")
                }
                .tag(Tab.stats)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DukePersonDict())
    }
}
