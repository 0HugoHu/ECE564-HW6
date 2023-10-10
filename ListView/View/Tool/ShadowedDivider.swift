//
//  ShadowedDivider.swift
//  Hugo
//
//  Created by Hugooooo on 10/1/23.
//

import SwiftUI

struct ShadowedDivider: View {
    var body: some View {
        ZStack(alignment: .leading) {
            Divider()
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.5), radius: 2, x: 0, y: 1)
        }
    }
}


struct ShadowedDivider_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

