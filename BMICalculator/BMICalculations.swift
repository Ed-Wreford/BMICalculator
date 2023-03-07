//
//  BMICalculations.swift
//  BMICalculator
//
//  Created by Cormell, David - DPC on 24/02/2022.
//

import Foundation



class BMICalculations: ObservableObject {
    func calculateBmi(weight: Double, height: Double) -> Double {
        var heightInMeters = height/100
        heightInMeters = heightInMeters*heightInMeters
        var bmi: Double = weight/heightInMeters
        bmi = bmi.rounded(toPlaces: 1)
        
        return bmi
    }
    
    func lookUpBmiClassification(bmi: Double) -> String {
        var weightCatagory: String = ""
        if bmi < 18.5 {
            weightCatagory = "underweight"
        }
        if bmi >= 18.5 {
            if bmi <= 24.9 {
                weightCatagory = "healthy"
            }
        }
        if bmi >= 25 {
            if bmi <= 29.9 {
                weightCatagory = "overweight"
            }
        }
        if bmi >= 30 {
            weightCatagory = "obese"
        }
        return weightCatagory
    }
}
