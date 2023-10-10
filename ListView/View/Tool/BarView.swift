//
//  BarView.swift
//  BarChartCalories
//
//  Created by Christian Leovido on 26/03/2020.
//  Copyright © 2020 Christian Leovido. All rights reserved.
//

import SwiftUI

struct BarView: View {

    var val: CGFloat
    var name: String

    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Capsule()
                    .foregroundColor(Color.black)
                    .frame(width: 25, height: 300, alignment: .bottom)
                Capsule()
                    .foregroundColor(Color(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)))
                    .frame(width: 25, height: val, alignment: .bottom)
            }
            Text(name)
                .font(.headline)
                .foregroundColor(.black)
                .padding(.top, 10)
                .padding(.bottom, 10)
            Text("\(calculatePercentage(height: val))%")
                .font(.footnote)
                .foregroundColor(.black)
        }
        .padding([.leading, .trailing], 10)
    }

    func calculatePercentage(height: CGFloat) -> String {
        let f = Float(height / 300 * 100).rounded(.up)
        return Int(f).description
    }
}


struct BarView_Previews: PreviewProvider {
    static var previews: some View {
        BarView(val: 300, name: "F")
    }
}
