//
//  NoResult.swift
//  Hugo
//
//  Created by Hugooooo on 10/1/23.
//

import SwiftUI

struct NoResult: View {
    var body: some View {
        Text("No result")
            .font(.headline)
            .padding()
            .padding([.trailing, .leading], 116)
            .foregroundColor(.gray)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 3)
    }
}


struct NoResult_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

