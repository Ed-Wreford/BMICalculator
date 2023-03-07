//
//  ContentView.swift
//  BMICalculator
//
//  Created by David Cormell on 23/02/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var height: String = ""
    @State private var weight: String = ""
    @State private var bmiReturned: String = ""
    @State private var healthReturned: String = ""
    @State private var bmiCalculations = BMICalculations()
    
    var body: some View {
        
        VStack {
            Image("PublicHealth")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            Form {
                
                TextField(
                    "Enter your height (cm): ",
                    text: $height
                )
                TextField(
                    "Enter your weight (kg): ",
                    text: $weight
                )

                Text("Your BMI is: \(bmiReturned)")
                Text("You are \(healthReturned)")
            }
            Section {
                Button("Calculate BMI", action: { getBmi(); getWeightRange() } )
            }
        }
        
    }
    
    func getBmi() -> String {
        
        bmiReturned = String(bmiCalculations.calculateBmi(weight: Double(weight) ?? 0, height: Double(height) ?? 0 ))
        
        return bmiReturned
    }
    
    func getWeightRange() -> String {
        healthReturned = String(bmiCalculations.lookUpBmiClassification(bmi: bmiCalculations.calculateBmi(weight: Double(weight) ?? 0, height: Double(height) ?? 0 )))
        
        return healthReturned
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
