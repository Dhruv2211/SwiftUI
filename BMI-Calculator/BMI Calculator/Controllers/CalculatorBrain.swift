import Foundation
import UIKit

struct CalculatorBrain {
    
    
    var bmi: BMI?
    var advice: String?
    var color: UIColor?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / pow(height, 2)
      
        
        if bmiValue < 18.5{
            bmi = BMI(value: bmiValue, advice: "Eat more pies", color: UIColor.blue)
        }
        else if (bmiValue <= 24.9){
            bmi = BMI(value: bmiValue, advice: "Fit as fiddle!", color: UIColor.green)
        }
        else{
            bmi = BMI(value: bmiValue, advice: "Eat les pies", color: UIColor.red)
        }
        
        
        //return bmiValueResult
    }
    
    func getBMIValue() -> String {
        
        let bmiValueResult = String(format: "%.1f", bmi?.value ?? "0.0") //Nil Coalescing Operation "??"
            return bmiValueResult
       
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    
    func getColor() -> UIColor{
        return bmi?.color ?? UIColor.white
    }
}
