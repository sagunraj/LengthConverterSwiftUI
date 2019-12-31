//
//  ContentView.swift
//  LengthConverterSwiftUI
//
//  Created by Sagun Raj Lage on 12/31/19.
//  Copyright © 2019 Sagun Raj Lage. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    @State var inputValue: String = ""
    @State var outputValue: String = "0"
    @State var selectedInputUnit = 0
    @State var selectedOutputUnit = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Input")) {
                        VStack {
                            TextField("Input value", text: $inputValue)
                                .keyboardType(.decimalPad)
                            HStack {
                                Text("Units")
                                Picker("Units", selection: $selectedInputUnit) {
                                    ForEach(0 ..< viewModel.units.count) {
                                        Text("\(self.viewModel.units[$0])")
                                    }
                                }.pickerStyle(SegmentedPickerStyle())
                            }
                        }
                    }
                    Section(header: Text("Output")) {
                        VStack {
                            TextField("Output value", text: $outputValue)
                                .keyboardType(.decimalPad)
                                .disabled(true)
                            HStack {
                                Text("Units")
                                Picker("Units", selection: $selectedOutputUnit) {
                                    ForEach(0 ..< viewModel.units.count) {
                                        Text("\(self.viewModel.units[$0])")
                                    }
                                }.pickerStyle(SegmentedPickerStyle())
                            }
                        }
                    }
                }.navigationBarTitle("Length Converter")
                Button("Calculate", action: {
                    if let input = Double(self.inputValue) {
                    let calculatedValue = self.viewModel.performCalculation(with: input,
                                                                            inputTypeIndex: self.selectedInputUnit,
                                                                            outputTypeIndex: self.selectedOutputUnit)
                    if let result = calculatedValue {
                        self.outputValue = "\(result)"
                    }
                }
                }).disabled(inputValue.count == 0)
            }.onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}
