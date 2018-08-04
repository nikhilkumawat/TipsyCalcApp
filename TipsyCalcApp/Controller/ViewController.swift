//
//  ViewController.swift
//  TipsyCalcApp
//
//  Created by SCL IT on 04/08/18.
//  Copyright © 2018 Nikhil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var tipPercentageLbl: UILabel!
    @IBOutlet weak var tipLbl: UILabel!
    @IBOutlet weak var totalLbl: UILabel!
    
    @IBOutlet weak var splitPercentageLbl: UILabel!
    @IBOutlet weak var splitPercentageSlider: UISlider!
    @IBOutlet weak var payLbl: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    
    var tip = TipModel(billAmount: 0.0, tipPercent: 0.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTipCalculationValues()
        updateUI()
    }
    
    func setTipCalculationValues(){
        tip.tipPercent = Double(tipPercentageSlider.value)
        tip.billAmount = ((textField.text)! as NSString).doubleValue
        tip.calculateTip()
    }
    
    func updateUI(){
        tipLbl.text = String(format: "$%0.2f", tip.tipAmount)
        totalLbl.text = String(format: "$%0.2f", tip.totalAmount)
        tipPercentageLbl.text = "Tip: \(Int(tipPercentageSlider.value * 100))%"
    }
    
    func updatePayment(){
        numberLabel.text = String(format: "%d", Int(splitPercentageSlider.value * 10))
        payLbl.text = String(splitPercentageSlider.value * Float(tip.totalAmount))
        
    }

    @IBAction func billAmountWasChanged(_ sender: Any) {
        setTipCalculationValues()
        updateUI()
    }
    
    @IBAction func tipPercentageDidChange(_ sender: UISlider) {
        let steps: Float = 100
        let roundedValue = round(sender.value * steps)/steps
        sender.value = roundedValue
        
        setTipCalculationValues()
        updateUI()
    }
    
    @IBAction func splitPercentageDidChange(_ sender: UISlider) {
        let steps: Float = 100
        let roundedValue = round(sender.value * steps)/steps
        sender.value = roundedValue
        
        updatePayment()
    }
    
    
    
    
}

