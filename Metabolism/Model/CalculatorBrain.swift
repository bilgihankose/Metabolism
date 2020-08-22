//
//  CalculatorBrain.swift
//  Metabolism
//
//  Created by Bilgihan Köse on 22.08.2020.
//  Copyright © 2020 Bilgihan Kose. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    func getBMIValue() -> String {
        
        let bmiValue = String(format: "%.1f", bmi?.value ?? 0.0)
        
        return bmiValue
    }
    
    func getAdvice() -> String {
        
        return bmi!.advice
    }
    
    func getColor() -> UIColor   {
       
        return bmi!.color
        
    }
    
    mutating func calculateBMI(_ height: Float, _ weight: Float ){
        let bmiValue = weight / (height * height)
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more!", color: .blue)
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Do more what you do!", color: .green)
        } else {
            bmi = BMI(value: bmiValue, advice: "Please don't eat more", color: .red)
        }
        
    }
}
