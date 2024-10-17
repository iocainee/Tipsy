import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipsyBrain = TipsyBrain()
    
    var tipPercentage: Float = 0.1
    var splitNumber: Int = 2
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        tipPercentage = tipsyBrain.getTipsPercentage(sender.currentTitle ?? "0")

        zeroPctButton.isSelected = tipsyBrain.tipsChosen(tipPercentage)[0]
        tenPctButton.isSelected = tipsyBrain.tipsChosen(tipPercentage)[1]
        twentyPctButton.isSelected = tipsyBrain.tipsChosen(tipPercentage)[2]
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumber = Int(sender.value)
        self.splitNumberLabel.text = "\(splitNumber)"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = Float(billTextField.text ?? "0") ?? 0.0
        
        tipsyBrain.calculateTotalBill(tipPercentage: tipPercentage,
                                splitNumber: splitNumber,
                                bill: bill)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalBill = tipsyBrain.getTotalBill()
            destinationVC.splitNumber = splitNumber
            destinationVC.tipPercentage = String(tipPercentage)
        }
    }
}

