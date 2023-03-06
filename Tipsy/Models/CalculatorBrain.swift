import UIKit

struct CalculatorBrain {
    var valueCal : calValue?
    
    func getPriceValue() -> String {
        let totalToZeroDecimalPlace = String(format: "%.2f", valueCal?.value ?? 0.0)
        return totalToZeroDecimalPlace
    }
    func getTextInLabel() -> String{
        return valueCal?.textInLabel ?? "No Text"
    }
    
    mutating func calculatedPrice(bill: Float,tipPerCent: Float,stepper: Float){
        let total = (bill + (bill * tipPerCent)) / stepper
        let tip = (tipPerCent*100)
        let tipp = String(format: "%0.f", tip)
        let person = String(format: "%.0f", stepper)
        valueCal = calValue(value: total, textInLabel: "Split between \(person) people, with \(tipp)% tip.")
        

        
        
    }
    
}
