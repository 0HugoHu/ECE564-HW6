//
//  Languages.swift
//  Hugo
//
//  Created by Hugooooo on 10/19/23.
//

import Foundation
import SwiftUI

struct Java: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.55078*width, y: 0.09375*height))
        path.addCurve(to: CGPoint(x: 0.375*width, y: 0.34669*height), control1: CGPoint(x: 0.59459*width, y: 0.19716*height), control2: CGPoint(x: 0.39369*width, y: 0.2605*height))
        path.addCurve(to: CGPoint(x: 0.49416*width, y: 0.51856*height), control1: CGPoint(x: 0.35791*width, y: 0.42578*height), control2: CGPoint(x: 0.49403*width, y: 0.51856*height))
        path.addCurve(to: CGPoint(x: 0.4375*width, y: 0.40722*height), control1: CGPoint(x: 0.47337*width, y: 0.48584*height), control2: CGPoint(x: 0.45825*width, y: 0.45825*height))
        path.addCurve(to: CGPoint(x: 0.55078*width, y: 0.09375*height), control1: CGPoint(x: 0.40234*width, y: 0.32103*height), control2: CGPoint(x: 0.65172*width, y: 0.24328*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.68359*width, y: 0.23731*height))
        path.addCurve(to: CGPoint(x: 0.49903*width, y: 0.36328*height), control1: CGPoint(x: 0.49903*width, y: 0.36328*height), control2: CGPoint(x: 0.50794*width, y: 0.24841*height))
        path.addCurve(to: CGPoint(x: 0.54688*width, y: 0.47853*height), control1: CGPoint(x: 0.49497*width, y: 0.41444*height), control2: CGPoint(x: 0.54541*width, y: 0.44128*height))
        path.addCurve(to: CGPoint(x: 0.51659*width, y: 0.53416*height), control1: CGPoint(x: 0.54812*width, y: 0.50891*height), control2: CGPoint(x: 0.51659*width, y: 0.53416*height))
        path.addCurve(to: CGPoint(x: 0.59081*width, y: 0.47753*height), control1: CGPoint(x: 0.51659*width, y: 0.53416*height), control2: CGPoint(x: 0.57312*width, y: 0.52394*height))
        path.addCurve(to: CGPoint(x: 0.55859*width, y: 0.34959*height), control1: CGPoint(x: 0.61034*width, y: 0.42603*height), control2: CGPoint(x: 0.55275*width, y: 0.39088*height))
        path.addCurve(to: CGPoint(x: 0.68359*width, y: 0.23731*height), control1: CGPoint(x: 0.56422*width, y: 0.31019*height), control2: CGPoint(x: 0.68359*width, y: 0.23731*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.72656*width, y: 0.50194*height))
        path.addCurve(to: CGPoint(x: 0.66894*width, y: 0.52147*height), control1: CGPoint(x: 0.70813*width, y: 0.50109*height), control2: CGPoint(x: 0.68737*width, y: 0.50794*height))
        path.addCurve(to: CGPoint(x: 0.73634*width, y: 0.5625*height), control1: CGPoint(x: 0.70531*width, y: 0.51344*height), control2: CGPoint(x: 0.73634*width, y: 0.53625*height))
        path.addCurve(to: CGPoint(x: 0.65234*width, y: 0.67675*height), control1: CGPoint(x: 0.73634*width, y: 0.62134*height), control2: CGPoint(x: 0.65234*width, y: 0.67675*height))
        path.addCurve(to: CGPoint(x: 0.78222*width, y: 0.56544*height), control1: CGPoint(x: 0.65234*width, y: 0.67675*height), control2: CGPoint(x: 0.78222*width, y: 0.66222*height))
        path.addCurve(to: CGPoint(x: 0.72656*width, y: 0.50194*height), control1: CGPoint(x: 0.78222*width, y: 0.5255*height), control2: CGPoint(x: 0.75722*width, y: 0.50341*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.38184*width, y: 0.50294*height))
        path.addCurve(to: CGPoint(x: 0.24609*width, y: 0.54688*height), control1: CGPoint(x: 0.33653*width, y: 0.5045*height), control2: CGPoint(x: 0.24609*width, y: 0.51197*height))
        path.addCurve(to: CGPoint(x: 0.60744*width, y: 0.56934*height), control1: CGPoint(x: 0.24609*width, y: 0.59547*height), control2: CGPoint(x: 0.45678*width, y: 0.59925*height))
        path.addCurve(to: CGPoint(x: 0.65919*width, y: 0.53028*height), control1: CGPoint(x: 0.60744*width, y: 0.56934*height), control2: CGPoint(x: 0.64844*width, y: 0.54078*height))
        path.addCurve(to: CGPoint(x: 0.33497*width, y: 0.53613*height), control1: CGPoint(x: 0.56044*width, y: 0.55078*height), control2: CGPoint(x: 0.33497*width, y: 0.55397*height))
        path.addCurve(to: CGPoint(x: 0.40722*width, y: 0.50294*height), control1: CGPoint(x: 0.33497*width, y: 0.51978*height), control2: CGPoint(x: 0.40722*width, y: 0.50294*height))
        path.addCurve(to: CGPoint(x: 0.38184*width, y: 0.50294*height), control1: CGPoint(x: 0.40722*width, y: 0.50294*height), control2: CGPoint(x: 0.39697*width, y: 0.50244*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.36816*width, y: 0.59278*height))
        path.addCurve(to: CGPoint(x: 0.30662*width, y: 0.63084*height), control1: CGPoint(x: 0.34337*width, y: 0.59278*height), control2: CGPoint(x: 0.30662*width, y: 0.61206*height))
        path.addCurve(to: CGPoint(x: 0.63087*width, y: 0.64256*height), control1: CGPoint(x: 0.30662*width, y: 0.66869*height), control2: CGPoint(x: 0.49319*width, y: 0.69775*height))
        path.addLine(to: CGPoint(x: 0.583*width, y: 0.61328*height))
        path.addCurve(to: CGPoint(x: 0.36816*width, y: 0.59278*height), control1: CGPoint(x: 0.48962*width, y: 0.64381*height), control2: CGPoint(x: 0.31712*width, y: 0.63366*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.39159*width, y: 0.67772*height))
        path.addCurve(to: CGPoint(x: 0.33594*width, y: 0.71484*height), control1: CGPoint(x: 0.35778*width, y: 0.67772*height), control2: CGPoint(x: 0.33594*width, y: 0.69909*height))
        path.addCurve(to: CGPoint(x: 0.61816*width, y: 0.71875*height), control1: CGPoint(x: 0.33594*width, y: 0.76328*height), control2: CGPoint(x: 0.53797*width, y: 0.76806*height))
        path.addLine(to: CGPoint(x: 0.56737*width, y: 0.68553*height))
        path.addCurve(to: CGPoint(x: 0.39159*width, y: 0.67772*height), control1: CGPoint(x: 0.50756*width, y: 0.71131*height), control2: CGPoint(x: 0.35706*width, y: 0.71509*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.27831*width, y: 0.72169*height))
        path.addCurve(to: CGPoint(x: 0.1875*width, y: 0.76656*height), control1: CGPoint(x: 0.22316*width, y: 0.72059*height), control2: CGPoint(x: 0.1875*width, y: 0.74559*height))
        path.addCurve(to: CGPoint(x: 0.75294*width, y: 0.75875*height), control1: CGPoint(x: 0.1875*width, y: 0.87825*height), control2: CGPoint(x: 0.75294*width, y: 0.87291*height))
        path.addCurve(to: CGPoint(x: 0.72266*width, y: 0.72653*height), control1: CGPoint(x: 0.75294*width, y: 0.73984*height), control2: CGPoint(x: 0.73059*width, y: 0.73081*height))
        path.addCurve(to: CGPoint(x: 0.26075*width, y: 0.76266*height), control1: CGPoint(x: 0.76881*width, y: 0.83566*height), control2: CGPoint(x: 0.26075*width, y: 0.82713*height))
        path.addCurve(to: CGPoint(x: 0.333*width, y: 0.74022*height), control1: CGPoint(x: 0.26075*width, y: 0.74803*height), control2: CGPoint(x: 0.29834*width, y: 0.73337*height))
        path.addLine(to: CGPoint(x: 0.30372*width, y: 0.72359*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.8125*width, y: 0.79688*height))
        path.addCurve(to: CGPoint(x: 0.29003*width, y: 0.85841*height), control1: CGPoint(x: 0.72656*width, y: 0.88*height), control2: CGPoint(x: 0.50906*width, y: 0.90978*height))
        path.addCurve(to: CGPoint(x: 0.8125*width, y: 0.79688*height), control1: CGPoint(x: 0.50903*width, y: 0.94997*height), control2: CGPoint(x: 0.81141*width, y: 0.89903*height))
        path.closeSubpath()
        return path
    }
}

struct Python: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.97872*width, y: 0.37559*height))
        path.addCurve(to: CGPoint(x: 0.86028*width, y: 0.25559*height), control1: CGPoint(x: 0.96158*width, y: 0.30702*height), control2: CGPoint(x: 0.92885*width, y: 0.25559*height))
        path.addLine(to: CGPoint(x: 0.77145*width, y: 0.25559*height))
        path.addLine(to: CGPoint(x: 0.77145*width, y: 0.36157*height))
        path.addCurve(to: CGPoint(x: 0.62339*width, y: 0.51274*height), control1: CGPoint(x: 0.77145*width, y: 0.44417*height), control2: CGPoint(x: 0.70131*width, y: 0.51274*height))
        path.addLine(to: CGPoint(x: 0.38494*width, y: 0.51274*height))
        path.addCurve(to: CGPoint(x: 0.2665*width, y: 0.6343*height), control1: CGPoint(x: 0.31949*width, y: 0.51274*height), control2: CGPoint(x: 0.2665*width, y: 0.56884*height))
        path.addLine(to: CGPoint(x: 0.2665*width, y: 0.86028*height))
        path.addCurve(to: CGPoint(x: 0.38494*width, y: 0.98184*height), control1: CGPoint(x: 0.2665*width, y: 0.92418*height), control2: CGPoint(x: 0.3226*width, y: 0.96314*height))
        path.addCurve(to: CGPoint(x: 0.62339*width, y: 0.98184*height), control1: CGPoint(x: 0.45975*width, y: 1.00366*height), control2: CGPoint(x: 0.533*width, y: 1.00833*height))
        path.addCurve(to: CGPoint(x: 0.74184*width, y: 0.86028*height), control1: CGPoint(x: 0.68261*width, y: 0.9647*height), control2: CGPoint(x: 0.74184*width, y: 0.92885*height))
        path.addLine(to: CGPoint(x: 0.74184*width, y: 0.76989*height))
        path.addLine(to: CGPoint(x: 0.50339*width, y: 0.76989*height))
        path.addLine(to: CGPoint(x: 0.50339*width, y: 0.74028*height))
        path.addLine(to: CGPoint(x: 0.86028*width, y: 0.74028*height))
        path.addCurve(to: CGPoint(x: 0.97872*width, y: 0.62027*height), control1: CGPoint(x: 0.92885*width, y: 0.74028*height), control2: CGPoint(x: 0.95535*width, y: 0.69196*height))
        path.addCurve(to: CGPoint(x: 0.97872*width, y: 0.37559*height), control1: CGPoint(x: 1.00366*width, y: 0.54235*height), control2: CGPoint(x: 1.00366*width, y: 0.47066*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.63742*width, y: 0.82755*height))
        path.addCurve(to: CGPoint(x: 0.68261*width, y: 0.87275*height), control1: CGPoint(x: 0.66235*width, y: 0.82755*height), control2: CGPoint(x: 0.68261*width, y: 0.84781*height))
        path.addCurve(to: CGPoint(x: 0.63742*width, y: 0.91794*height), control1: CGPoint(x: 0.68261*width, y: 0.89768*height), control2: CGPoint(x: 0.66235*width, y: 0.91794*height))
        path.addCurve(to: CGPoint(x: 0.59222*width, y: 0.87275*height), control1: CGPoint(x: 0.61248*width, y: 0.9195*height), control2: CGPoint(x: 0.59222*width, y: 0.89768*height))
        path.addCurve(to: CGPoint(x: 0.63742*width, y: 0.82755*height), control1: CGPoint(x: 0.59222*width, y: 0.84781*height), control2: CGPoint(x: 0.61248*width, y: 0.82755*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.37403*width, y: 0.48157*height))
        path.addLine(to: CGPoint(x: 0.61248*width, y: 0.48157*height))
        path.addCurve(to: CGPoint(x: 0.73093*width, y: 0.36001*height), control1: CGPoint(x: 0.67794*width, y: 0.48157*height), control2: CGPoint(x: 0.73093*width, y: 0.42702*height))
        path.addLine(to: CGPoint(x: 0.73093*width, y: 0.13403*height))
        path.addCurve(to: CGPoint(x: 0.61248*width, y: 0.01091*height), control1: CGPoint(x: 0.73093*width, y: 0.07013*height), control2: CGPoint(x: 0.67638*width, y: 0.02182*height))
        path.addCurve(to: CGPoint(x: 0.37403*width, y: 0.01091*height), control1: CGPoint(x: 0.533*width, y: -0.00156*height), control2: CGPoint(x: 0.44572*width, y: -0.00156*height))
        path.addCurve(to: CGPoint(x: 0.25559*width, y: 0.13403*height), control1: CGPoint(x: 0.27273*width, y: 0.02805*height), control2: CGPoint(x: 0.25559*width, y: 0.06546*height))
        path.addLine(to: CGPoint(x: 0.25559*width, y: 0.22442*height))
        path.addLine(to: CGPoint(x: 0.49404*width, y: 0.22442*height))
        path.addLine(to: CGPoint(x: 0.49404*width, y: 0.25403*height))
        path.addLine(to: CGPoint(x: 0.16676*width, y: 0.25403*height))
        path.addCurve(to: CGPoint(x: 0.0187*width, y: 0.37403*height), control1: CGPoint(x: 0.09818*width, y: 0.25403*height), control2: CGPoint(x: 0.0374*width, y: 0.29611*height))
        path.addCurve(to: CGPoint(x: 0.0187*width, y: 0.6156*height), control1: CGPoint(x: -0.00312*width, y: 0.46443*height), control2: CGPoint(x: -0.00468*width, y: 0.52053*height))
        path.addCurve(to: CGPoint(x: 0.14494*width, y: 0.7356*height), control1: CGPoint(x: 0.03584*width, y: 0.68573*height), control2: CGPoint(x: 0.07637*width, y: 0.7356*height))
        path.addLine(to: CGPoint(x: 0.22598*width, y: 0.7356*height))
        path.addLine(to: CGPoint(x: 0.22598*width, y: 0.62651*height))
        path.addCurve(to: CGPoint(x: 0.37403*width, y: 0.48157*height), control1: CGPoint(x: 0.22442*width, y: 0.55014*height), control2: CGPoint(x: 0.29299*width, y: 0.48157*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.35845*width, y: 0.16364*height))
        path.addCurve(to: CGPoint(x: 0.31325*width, y: 0.11844*height), control1: CGPoint(x: 0.33351*width, y: 0.16364*height), control2: CGPoint(x: 0.31325*width, y: 0.14338*height))
        path.addCurve(to: CGPoint(x: 0.35845*width, y: 0.07325*height), control1: CGPoint(x: 0.31325*width, y: 0.09351*height), control2: CGPoint(x: 0.33351*width, y: 0.07325*height))
        path.addCurve(to: CGPoint(x: 0.40365*width, y: 0.11844*height), control1: CGPoint(x: 0.38339*width, y: 0.07325*height), control2: CGPoint(x: 0.40365*width, y: 0.09351*height))
        path.addCurve(to: CGPoint(x: 0.35845*width, y: 0.16364*height), control1: CGPoint(x: 0.40365*width, y: 0.14338*height), control2: CGPoint(x: 0.38339*width, y: 0.16364*height))
        path.closeSubpath()
        return path
    }
}

struct JavaScript: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.15625*width, y: 0.15625*height))
        path.addLine(to: CGPoint(x: 0.15625*width, y: 0.84375*height))
        path.addLine(to: CGPoint(x: 0.84375*width, y: 0.84375*height))
        path.addLine(to: CGPoint(x: 0.84375*width, y: 0.15625*height))
        path.addLine(to: CGPoint(x: 0.15625*width, y: 0.15625*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.21875*width, y: 0.21875*height))
        path.addLine(to: CGPoint(x: 0.78125*width, y: 0.21875*height))
        path.addLine(to: CGPoint(x: 0.78125*width, y: 0.78125*height))
        path.addLine(to: CGPoint(x: 0.21875*width, y: 0.78125*height))
        path.addLine(to: CGPoint(x: 0.21875*width, y: 0.21875*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.63262*width, y: 0.46875*height))
        path.addCurve(to: CGPoint(x: 0.55931*width, y: 0.535*height), control1: CGPoint(x: 0.58809*width, y: 0.46875*height), control2: CGPoint(x: 0.55931*width, y: 0.49725*height))
        path.addCurve(to: CGPoint(x: 0.61956*width, y: 0.61094*height), control1: CGPoint(x: 0.55931*width, y: 0.57594*height), control2: CGPoint(x: 0.58337*width, y: 0.59553*height))
        path.addLine(to: CGPoint(x: 0.63206*width, y: 0.61634*height))
        path.addCurve(to: CGPoint(x: 0.66859*width, y: 0.64953*height), control1: CGPoint(x: 0.65497*width, y: 0.62644*height), control2: CGPoint(x: 0.66859*width, y: 0.63231*height))
        path.addCurve(to: CGPoint(x: 0.63447*width, y: 0.6745*height), control1: CGPoint(x: 0.66859*width, y: 0.66406*height), control2: CGPoint(x: 0.65525*width, y: 0.6745*height))
        path.addCurve(to: CGPoint(x: 0.58516*width, y: 0.64391*height), control1: CGPoint(x: 0.60984*width, y: 0.6745*height), control2: CGPoint(x: 0.59584*width, y: 0.66144*height))
        path.addLine(to: CGPoint(x: 0.54422*width, y: 0.66734*height))
        path.addCurve(to: CGPoint(x: 0.63563*width, y: 0.71875*height), control1: CGPoint(x: 0.55872*width, y: 0.69644*height), control2: CGPoint(x: 0.589*width, y: 0.71875*height))
        path.addCurve(to: CGPoint(x: 0.71875*width, y: 0.649*height), control1: CGPoint(x: 0.68313*width, y: 0.71875*height), control2: CGPoint(x: 0.71875*width, y: 0.69412*height))
        path.addCurve(to: CGPoint(x: 0.65191*width, y: 0.57*height), control1: CGPoint(x: 0.71875*width, y: 0.60681*height), control2: CGPoint(x: 0.69469*width, y: 0.58809*height))
        path.addLine(to: CGPoint(x: 0.63947*width, y: 0.56463*height))
        path.addCurve(to: CGPoint(x: 0.60859*width, y: 0.53406*height), control1: CGPoint(x: 0.61781*width, y: 0.55513*height), control2: CGPoint(x: 0.60859*width, y: 0.54891*height))
        path.addCurve(to: CGPoint(x: 0.63266*width, y: 0.51238*height), control1: CGPoint(x: 0.60859*width, y: 0.52187*height), control2: CGPoint(x: 0.61778*width, y: 0.51238*height))
        path.addCurve(to: CGPoint(x: 0.66497*width, y: 0.53406*height), control1: CGPoint(x: 0.64719*width, y: 0.51238*height), control2: CGPoint(x: 0.65634*width, y: 0.51863*height))
        path.addLine(to: CGPoint(x: 0.70422*width, y: 0.50884*height))
        path.addCurve(to: CGPoint(x: 0.63266*width, y: 0.46875*height), control1: CGPoint(x: 0.68759*width, y: 0.47978*height), control2: CGPoint(x: 0.66469*width, y: 0.46875*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.44981*width, y: 0.47175*height))
        path.addLine(to: CGPoint(x: 0.44981*width, y: 0.64247*height))
        path.addCurve(to: CGPoint(x: 0.42278*width, y: 0.67388*height), control1: CGPoint(x: 0.44981*width, y: 0.66741*height), control2: CGPoint(x: 0.43912*width, y: 0.67388*height))
        path.addCurve(to: CGPoint(x: 0.39044*width, y: 0.64806*height), control1: CGPoint(x: 0.40559*width, y: 0.67388*height), control2: CGPoint(x: 0.39816*width, y: 0.66203*height))
        path.addLine(to: CGPoint(x: 0.3495*width, y: 0.67275*height))
        path.addCurve(to: CGPoint(x: 0.42488*width, y: 0.71875*height), control1: CGPoint(x: 0.36138*width, y: 0.69797*height), control2: CGPoint(x: 0.38478*width, y: 0.71875*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.643*height), control1: CGPoint(x: 0.46937*width, y: 0.71875*height), control2: CGPoint(x: 0.5*width, y: 0.695*height))
        path.addLine(to: CGPoint(x: 0.5*width, y: 0.47175*height))
        path.addLine(to: CGPoint(x: 0.44984*width, y: 0.47175*height))
        path.closeSubpath()
        return path
    }
}

struct Swift: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.91617*width, y: 0.68117*height))
        path.addCurve(to: CGPoint(x: 0.92083*width, y: 0.66717*height), control1: CGPoint(x: 0.9185*width, y: 0.6765*height), control2: CGPoint(x: 0.9185*width, y: 0.67183*height))
        path.addCurve(to: CGPoint(x: 0.61471*width, y: 0.05496*height), control1: CGPoint(x: 0.97692*width, y: 0.4475*height), control2: CGPoint(x: 0.84371*width, y: 0.1905*height))
        path.addCurve(to: CGPoint(x: 0.71988*width, y: 0.49658*height), control1: CGPoint(x: 0.71521*width, y: 0.1905*height), control2: CGPoint(x: 0.75492*width, y: 0.35171*height))
        path.addCurve(to: CGPoint(x: 0.70821*width, y: 0.53396*height), control1: CGPoint(x: 0.71754*width, y: 0.50825*height), control2: CGPoint(x: 0.71288*width, y: 0.52229*height))
        path.addCurve(to: CGPoint(x: 0.21987*width, y: 0.13675*height), control1: CGPoint(x: 0.21987*width, y: 0.13675*height), control2: CGPoint(x: 0.46283*width, y: 0.38208*height))
        path.addCurve(to: CGPoint(x: 0.50492*width, y: 0.49425*height), control1: CGPoint(x: 0.21283*width, y: 0.12975*height), control2: CGPoint(x: 0.35071*width, y: 0.333*height))
        path.addCurve(to: CGPoint(x: 0.09833*width, y: 0.18579*height), control1: CGPoint(x: 0.4325*width, y: 0.45217*height), control2: CGPoint(x: 0.22687*width, y: 0.305*height))
        path.addCurve(to: CGPoint(x: 0.15442*width, y: 0.26292*height), control1: CGPoint(x: 0.11238*width, y: 0.2115*height), control2: CGPoint(x: 0.13342*width, y: 0.23721*height))
        path.addCurve(to: CGPoint(x: 0.57037*width, y: 0.6975*height), control1: CGPoint(x: 0.26192*width, y: 0.40079*height), control2: CGPoint(x: 0.40212*width, y: 0.569*height))
        path.addCurve(to: CGPoint(x: 0.11704*width, y: 0.6975*height), control1: CGPoint(x: 0.45121*width, y: 0.77*height), control2: CGPoint(x: 0.28529*width, y: 0.77463*height))
        path.addCurve(to: CGPoint(x: 0.00021*width, y: 0.62742*height), control1: CGPoint(x: 0.07496*width, y: 0.67883*height), control2: CGPoint(x: 0.03996*width, y: 0.65546*height))
        path.addCurve(to: CGPoint(x: 0.311*width, y: 0.89146*height), control1: CGPoint(x: 0.07029*width, y: 0.73725*height), control2: CGPoint(x: 0.18012*width, y: 0.83775*height))
        path.addCurve(to: CGPoint(x: 0.74092*width, y: 0.89146*height), control1: CGPoint(x: 0.46754*width, y: 0.95925*height), control2: CGPoint(x: 0.62642*width, y: 0.95458*height))
        path.addLine(to: CGPoint(x: 0.74329*width, y: 0.89146*height))
        path.addCurve(to: CGPoint(x: 0.75729*width, y: 0.88213*height), control1: CGPoint(x: 0.74796*width, y: 0.88913*height), control2: CGPoint(x: 0.75262*width, y: 0.88679*height))
        path.addCurve(to: CGPoint(x: 0.98396*width, y: 0.94054*height), control1: CGPoint(x: 0.81338*width, y: 0.85408*height), control2: CGPoint(x: 0.92321*width, y: 0.82371*height))
        path.addCurve(to: CGPoint(x: 0.91621*width, y: 0.68117*height), control1: CGPoint(x: 1.00029*width, y: 0.97325*height), control2: CGPoint(x: 1.03067*width, y: 0.82138*height))
        path.closeSubpath()
        return path
    }
}

struct C: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.72825*width, y: 0.17525*height))
        path.addCurve(to: CGPoint(x: 0.8273*width, y: 0.38295*height), control1: CGPoint(x: 0.78115*width, y: 0.2225*height), control2: CGPoint(x: 0.8144*width, y: 0.29145*height))
        path.addLine(to: CGPoint(x: 0.69025*width, y: 0.38295*height))
        path.addCurve(to: CGPoint(x: 0.63395*width, y: 0.272*height), control1: CGPoint(x: 0.68075*width, y: 0.3312*height), control2: CGPoint(x: 0.66175*width, y: 0.2945*height))
        path.addCurve(to: CGPoint(x: 0.52065*width, y: 0.236*height), control1: CGPoint(x: 0.60615*width, y: 0.248*height), control2: CGPoint(x: 0.56815*width, y: 0.236*height))
        path.addCurve(to: CGPoint(x: 0.3863*width, y: 0.3065*height), control1: CGPoint(x: 0.463*width, y: 0.236*height), control2: CGPoint(x: 0.4182*width, y: 0.25925*height))
        path.addCurve(to: CGPoint(x: 0.3368*width, y: 0.5022*height), control1: CGPoint(x: 0.35305*width, y: 0.3515*height), control2: CGPoint(x: 0.3368*width, y: 0.4167*height))
        path.addCurve(to: CGPoint(x: 0.38495*width, y: 0.6994*height), control1: CGPoint(x: 0.3368*width, y: 0.5869*height), control2: CGPoint(x: 0.3531*width, y: 0.6529*height))
        path.addCurve(to: CGPoint(x: 0.5193*width, y: 0.7699*height), control1: CGPoint(x: 0.4155*width, y: 0.74665*height), control2: CGPoint(x: 0.46025*width, y: 0.7699*height))
        path.addCurve(to: CGPoint(x: 0.693*width, y: 0.5997*height), control1: CGPoint(x: 0.62175*width, y: 0.7699*height), control2: CGPoint(x: 0.6794*width, y: 0.7129*height))
        path.addLine(to: CGPoint(x: 0.83*width, y: 0.5997*height))
        path.addCurve(to: CGPoint(x: 0.7269*width, y: 0.82315*height), control1: CGPoint(x: 0.8144*width, y: 0.69865*height), control2: CGPoint(x: 0.7798*width, y: 0.7729*height))
        path.addCurve(to: CGPoint(x: 0.51865*width, y: 0.89515*height), control1: CGPoint(x: 0.674*width, y: 0.87115*height), control2: CGPoint(x: 0.6041*width, y: 0.89515*height))
        path.addCurve(to: CGPoint(x: 0.2785*width, y: 0.7827*height), control1: CGPoint(x: 0.4162*width, y: 0.89515*height), control2: CGPoint(x: 0.33615*width, y: 0.85765*height))
        path.addCurve(to: CGPoint(x: 0.195*width, y: 0.50285*height), control1: CGPoint(x: 0.2228*width, y: 0.7113*height), control2: CGPoint(x: 0.195*width, y: 0.61835*height))
        path.addCurve(to: CGPoint(x: 0.2771*width, y: 0.2262*height), control1: CGPoint(x: 0.195*width, y: 0.3904*height), control2: CGPoint(x: 0.22215*width, y: 0.29815*height))
        path.addCurve(to: CGPoint(x: 0.52065*width, y: 0.11*height), control1: CGPoint(x: 0.3361*width, y: 0.149*height), control2: CGPoint(x: 0.4175*width, y: 0.11*height))
        path.addCurve(to: CGPoint(x: 0.72825*width, y: 0.17525*height), control1: CGPoint(x: 0.6068*width, y: 0.11*height), control2: CGPoint(x: 0.676*width, y: 0.13175*height))
        path.closeSubpath()
        return path
    }
}

struct CPlus: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.45231*width, y: 0.556*height))
        path.addLine(to: CGPoint(x: 0.6268*width, y: 0.62633*height))
        path.addCurve(to: CGPoint(x: 0.57144*width, y: 0.78977*height), control1: CGPoint(x: 0.6151*width, y: 0.69153*height), control2: CGPoint(x: 0.59662*width, y: 0.746*height))
        path.addCurve(to: CGPoint(x: 0.33496*width, y: 0.9222*height), control1: CGPoint(x: 0.44021*width, y: 0.91107*height), control2: CGPoint(x: 0.39267*width, y: 0.9222*height))
        path.addCurve(to: CGPoint(x: 0.16329*width, y: 0.88147*height), control1: CGPoint(x: 0.26491*width, y: 0.9222*height), control2: CGPoint(x: 0.20768*width, y: 0.90863*height))
        path.addCurve(to: CGPoint(x: 0.04836*width, y: 0.7382*height), control1: CGPoint(x: 0.1189*width, y: 0.85433*height), control2: CGPoint(x: 0.08059*width, y: 0.80657*height))
        path.addCurve(to: CGPoint(x: 0, y: 0.4757*height), control1: CGPoint(x: 0.0161*width, y: 0.66987*height), control2: CGPoint(x: 0, y: 0.58237*height))
        path.addCurve(to: CGPoint(x: 0.08505*width, y: 0.1479*height), control1: CGPoint(x: 0, y: 0.33353*height), control2: CGPoint(x: 0.02836*width, y: 0.22427*height))
        path.addCurve(to: CGPoint(x: 0.3257*width, y: 0.03333*height), control1: CGPoint(x: 0.14178*width, y: 0.0715*height), control2: CGPoint(x: 0.22198*width, y: 0.03333*height))
        path.addCurve(to: CGPoint(x: 0.51715*width, y: 0.09897*height), control1: CGPoint(x: 0.4069*width, y: 0.03333*height), control2: CGPoint(x: 0.47069*width, y: 0.0552*height))
        path.addCurve(to: CGPoint(x: 0.62068*width, y: 0.30053*height), control1: CGPoint(x: 0.56359*width, y: 0.1427*height), control2: CGPoint(x: 0.5981*width, y: 0.2099*height))
        path.addLine(to: CGPoint(x: 0.44483*width, y: 0.35267*height))
        path.addCurve(to: CGPoint(x: 0.4255*width, y: 0.29523*height), control1: CGPoint(x: 0.43868*width, y: 0.3265*height), control2: CGPoint(x: 0.43223*width, y: 0.30733*height))
        path.addCurve(to: CGPoint(x: 0.33056*width, y: 0.23197*height), control1: CGPoint(x: 0.36849*width, y: 0.23743*height), control2: CGPoint(x: 0.35049*width, y: 0.23197*height))
        path.addCurve(to: CGPoint(x: 0.22681*width, y: 0.30463*height), control1: CGPoint(x: 0.28542*width, y: 0.23197*height), control2: CGPoint(x: 0.25084*width, y: 0.2562*height))
        path.addCurve(to: CGPoint(x: 0.19955*width, y: 0.47397*height), control1: CGPoint(x: 0.20865*width, y: 0.34057*height), control2: CGPoint(x: 0.19955*width, y: 0.397*height))
        path.addCurve(to: CGPoint(x: 0.23208*width, y: 0.66997*height), control1: CGPoint(x: 0.19955*width, y: 0.5693*height), control2: CGPoint(x: 0.2104*width, y: 0.63463*height))
        path.addCurve(to: CGPoint(x: 0.3235*width, y: 0.72297*height), control1: CGPoint(x: 0.25376*width, y: 0.7053*height), control2: CGPoint(x: 0.28424*width, y: 0.72297*height))
        path.addCurve(to: CGPoint(x: 0.4099*width, y: 0.6802*height), control1: CGPoint(x: 0.36161*width, y: 0.72297*height), control2: CGPoint(x: 0.3904*width, y: 0.70873*height))
        path.addCurve(to: CGPoint(x: 0.45231*width, y: 0.556*height), control1: CGPoint(x: 0.42938*width, y: 0.6517*height), control2: CGPoint(x: 0.44351*width, y: 0.6103*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.68862*width, y: 0.61597*height))
        path.addLine(to: CGPoint(x: 0.78214*width, y: 0.61597*height))
        path.addLine(to: CGPoint(x: 0.78214*width, y: 0.49063*height))
        path.addLine(to: CGPoint(x: 0.86101*width, y: 0.49063*height))
        path.addLine(to: CGPoint(x: 0.86101*width, y: 0.61597*height))
        path.addLine(to: CGPoint(x: 0.95503*width, y: 0.61597*height))
        path.addLine(to: CGPoint(x: 0.95503*width, y: 0.72143*height))
        path.addLine(to: CGPoint(x: 0.86101*width, y: 0.72143*height))
        path.addLine(to: CGPoint(x: 0.86101*width, y: 0.8461*height))
        path.addLine(to: CGPoint(x: 0.78212*width, y: 0.8461*height))
        path.addLine(to: CGPoint(x: 0.78212*width, y: 0.72143*height))
        path.addLine(to: CGPoint(x: 0.68859*width, y: 0.72143*height))
        path.addLine(to: CGPoint(x: 0.68859*width, y: 0.61597*height))
        path.closeSubpath()
        return path
    }
}

struct Languages: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.64447*width, y: 0.03333*height))
        path.addLine(to: CGPoint(x: 0.6692*width, y: 0.0444*height))
        path.addLine(to: CGPoint(x: 0.8692*width, y: 0.2666*height))
        path.addLine(to: CGPoint(x: 0.8772*width, y: 0.2828*height))
        path.addLine(to: CGPoint(x: 0.8778*width, y: 0.28887*height))
        path.addLine(to: CGPoint(x: 0.8778*width, y: 0.48887*height))
        path.addLine(to: CGPoint(x: 0.81113*width, y: 0.48887*height))
        path.addLine(to: CGPoint(x: 0.81107*width, y: 0.3222*height))
        path.addLine(to: CGPoint(x: 0.6222*width, y: 0.3222*height))
        path.addLine(to: CGPoint(x: 0.58887*width, y: 0.28887*height))
        path.addLine(to: CGPoint(x: 0.58887*width, y: 0.1*height))
        path.addLine(to: CGPoint(x: 0.1778*width, y: 0.1*height))
        path.addLine(to: CGPoint(x: 0.16667*width, y: 0.11113*height))
        path.addLine(to: CGPoint(x: 0.16667*width, y: 0.91113*height))
        path.addCurve(to: CGPoint(x: 0.17427*width, y: 0.92167*height), control1: CGPoint(x: 0.16667*width, y: 0.916*height), control2: CGPoint(x: 0.16987*width, y: 0.9202*height))
        path.addLine(to: CGPoint(x: 0.1778*width, y: 0.9222*height))
        path.addLine(to: CGPoint(x: 0.44447*width, y: 0.9222*height))
        path.addLine(to: CGPoint(x: 0.44447*width, y: 0.98887*height))
        path.addLine(to: CGPoint(x: 0.1778*width, y: 0.98887*height))
        path.addLine(to: CGPoint(x: 0.1*width, y: 0.9112*height))
        path.addLine(to: CGPoint(x: 0.1*width, y: 0.1112*height))
        path.addCurve(to: CGPoint(x: 0.16933*width, y: 0.0338*height), control1: CGPoint(x: 0.1*width, y: 0.071*height), control2: CGPoint(x: 0.13033*width, y: 0.038*height))
        path.addLine(to: CGPoint(x: 0.1778*width, y: 0.03333*height))
        path.addLine(to: CGPoint(x: 0.64447*width, y: 0.03333*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.79673*width, y: 0.63927*height))
        path.addLine(to: CGPoint(x: 0.8014*width, y: 0.64307*height))
        path.addLine(to: CGPoint(x: 0.91247*width, y: 0.7542*height))
        path.addLine(to: CGPoint(x: 0.91247*width, y: 0.8014*height))
        path.addLine(to: CGPoint(x: 0.80133*width, y: 0.91247*height))
        path.addLine(to: CGPoint(x: 0.7542*width, y: 0.86527*height))
        path.addLine(to: CGPoint(x: 0.84173*width, y: 0.77773*height))
        path.addLine(to: CGPoint(x: 0.7542*width, y: 0.69027*height))
        path.addLine(to: CGPoint(x: 0.7542*width, y: 0.64307*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.66807*width, y: 0.64307*height))
        path.addLine(to: CGPoint(x: 0.668*width, y: 0.69027*height))
        path.addLine(to: CGPoint(x: 0.58047*width, y: 0.77773*height))
        path.addLine(to: CGPoint(x: 0.668*width, y: 0.86533*height))
        path.addLine(to: CGPoint(x: 0.668*width, y: 0.91247*height))
        path.addLine(to: CGPoint(x: 0.62087*width, y: 0.91247*height))
        path.addLine(to: CGPoint(x: 0.50973*width, y: 0.80133*height))
        path.addLine(to: CGPoint(x: 0.50973*width, y: 0.7542*height))
        path.addLine(to: CGPoint(x: 0.62087*width, y: 0.64307*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.7696*width, y: 0.25553*height))
        path.addLine(to: CGPoint(x: 0.65553*width, y: 0.1288*height))
        path.addLine(to: CGPoint(x: 0.65553*width, y: 0.25553*height))
        path.addLine(to: CGPoint(x: 0.7696*width, y: 0.25553*height))
        path.closeSubpath()
        return path
    }
}

struct Languages_Previews: PreviewProvider {
    static var previews: some View {
        Languages()
            .frame(width: 100, height: 100)
    }
}
