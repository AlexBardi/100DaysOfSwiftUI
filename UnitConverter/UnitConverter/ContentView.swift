//
//  ContentView.swift
//  UnitConverter
//
//  Created by Alexander Bardi on 3/5/22.
//

import SwiftUI

struct ContentView: View {
    @State private var inputNum = 32.0
    @State private var inputUnit = UnitTemperature.fahrenheit
    @State private var outputUnit = UnitTemperature.celsius
    @FocusState private var amountIsFocused: Bool
    
    let units = [UnitTemperature.fahrenheit, UnitTemperature.celsius, UnitTemperature.kelvin]
    
    var outputNum: Double {
        return Measurement(value: inputNum, unit: inputUnit).converted(to: outputUnit).value
    }
    
    var body: some View {
        NavigationView { // Allows the view to change for num of people
            Form {
                Section {
                    TextField("Input Number", value: $inputNum, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0.symbol)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("Input Number and Units")
                }
                
                Section {
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0.symbol)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("Output Units")
                }
                
                Section {
                    Text(outputNum.formatted() + outputUnit.symbol) //TODO format
                } header : {
                    Text("Output Number")
                }
            }
            .navigationTitle("Unit Converter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
