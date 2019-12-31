//
//  HomeViewModel.swift
//  LengthConverterSwiftUI
//
//  Created by Sagun Raj Lage on 12/31/19.
//  Copyright © 2019 Sagun Raj Lage. All rights reserved.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    let units = ["Metres", "Kilometres", "Feet", "Miles"]
    let unitArray: [UnitLength] = [.meters, .kilometers, .feet, .miles]
    
    func performCalculation(with input: Double,
                            inputTypeIndex: Int,
                            outputTypeIndex: Int) -> Double? {
        if inputTypeIndex == outputTypeIndex {
            return input
        } else if inputTypeIndex == 0 {
            let metres = Measurement(value: input, unit: UnitLength.meters)
            if outputTypeIndex == 1 {
                return metres.converted(to: .kilometers).value
            } else if outputTypeIndex == 2 {
                return metres.converted(to: .feet).value
            } else if outputTypeIndex == 3 {
                return metres.converted(to: .miles).value
            }
        } else if inputTypeIndex == 1 {
            let kilometers = Measurement(value: input, unit: UnitLength.kilometers)
            if outputTypeIndex == 0 {
                return kilometers.converted(to: .meters).value
            } else if outputTypeIndex == 2 {
                return kilometers.converted(to: .feet).value
            } else if outputTypeIndex == 3 {
                return kilometers.converted(to: .miles).value
            }
        } else if inputTypeIndex == 2 {
            let feet = Measurement(value: input, unit: UnitLength.feet)
            if outputTypeIndex == 0 {
                return feet.converted(to: .meters).value
            } else if outputTypeIndex == 1 {
                return feet.converted(to: .kilometers).value
            } else if outputTypeIndex == 3 {
                return feet.converted(to: .miles).value
            }
        } else {
            let miles = Measurement(value: input, unit: UnitLength.miles)
            if outputTypeIndex == 0 {
                return miles.converted(to: .meters).value
            } else if outputTypeIndex == 1 {
                return miles.converted(to: .kilometers).value
            } else if outputTypeIndex == 2 {
                return miles.converted(to: .feet).value
            }
        }
        return nil
    }
    
}
