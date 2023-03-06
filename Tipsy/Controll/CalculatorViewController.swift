
import UIKit

class CalculatorViewController: UIViewController, UITextFieldDelegate {
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var billTextField: UITextField!
    
    
    
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var tenPctButton: UIButton!
    
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    var tipPerCent : Float = 0.1
    var stepper : Float = 2
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        // Do any additional setup after loading the view.
    }
    @IBAction func tipChanged(_ sender: UIButton) {
        let tipAsnwer = sender.currentTitle!
        billTextField.endEditing(true)
       
        
        
        if tipAsnwer == "10%"{
            tipPerCent = 0.1
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            
        }else if tipAsnwer == "20%"{
            tipPerCent = 0.2
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            
        }else{
            tipPerCent = 0.0
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            
        }
        
    }
    
    @IBAction func stepperValueChange(_ sender: UIStepper) {
        stepper = Float(sender.value)
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill : String = self.billTextField.text!
        calculatorBrain.calculatedPrice(bill: Float(bill)!, tipPerCent: tipPerCent, stepper: stepper)
        performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.textString = calculatorBrain.getTextInLabel()
            destinationVC.priceValue = calculatorBrain.getPriceValue()
        }
    }
}


