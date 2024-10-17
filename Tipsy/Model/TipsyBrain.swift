struct TipsyBrain {
    
    var tipsButtonsStatus: [Bool] = [false, false, false]
    var totalBill: Float = 0.0
    
    mutating func tipsChosen(_ tips: Float) -> [Bool] {
        if tips == 0.0 {
            tipsButtonsStatus = [true, false, false]
            return tipsButtonsStatus
        } else if tips == 0.1 {
            tipsButtonsStatus = [false, true, false]
            return tipsButtonsStatus
        } else {
            tipsButtonsStatus = [false, false, true]
            return tipsButtonsStatus
        }
    }
    
    func getTipsPercentage(_ tips: String) -> Float {
        if tips == "0%" {
            return 0.0
        } else if tips == "10%" {
            return 0.1
        } else {
            return 0.2
        }
    }
    
    mutating func calculateTotalBill(tipPercentage: Float, splitNumber: Int, bill: Float) {
        totalBill = (bill + (bill * tipPercentage)) / Float(splitNumber)
    }
    
    func getTotalBill() -> String {
        return String(totalBill)
    }
    
}
