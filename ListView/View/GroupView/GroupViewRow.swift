//
//  GroupViewRow.swift
//  Hugo
//
//  Created by Hugooooo on 10/16/23.
//

import SwiftUI

struct GroupViewRow: View {
    var categoryName: String
    var people: [DukePerson]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(categoryName)
                    .font(.headline)
                
                HStack(spacing: 3) {
                    if people.count > 3 {
                        ForEach(0..<3, id: \.self) { _ in
                            Image(systemName: "person")
                                .resizable()
                                .frame(width: 14, height: 14)
                        }
                        Text("+\(people.count - 3)")
                    } else {
                        ForEach(0..<people.count, id: \.self) { _ in
                            Image(systemName: "person")
                                .resizable()
                                .frame(width: 14, height: 14)
                        }
                    }
                }
                .padding(.leading, 16)
                .foregroundStyle(Color.gray)
            }
            .padding(.top, 8)
            .padding(.bottom, -24)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(people, id: \.DUID) {person in
                        NavigationLink(
                            destination: DukePeopleListDetails(dukePerson: person)) {
                                GroupViewItem(dukePerson: person)
                            }
                    }
                }
            }
            .frame(height: 185)
            .padding(.bottom, -16)
            
        }
    }
}

struct GroupViewRow_Previews: PreviewProvider {
    static var dataModel = DukePersonDict()
    
    static var previews: some View {
        GroupViewRow(
            categoryName: TEAM,
            people: dataModel.people.compactMap({ $0.value.team == TEAM ? $0.value : nil })
        )
    }
}

