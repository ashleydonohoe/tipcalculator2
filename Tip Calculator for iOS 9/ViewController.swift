//
//  ViewController.swift
//  Tip Calculator for iOS 9
//
//  Created by Gabriele on 8/17/15.
//  Copyright © 2015 Ashley Donohoe. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtMealCost: UITextField!
    
    @IBOutlet weak var txtTipPercentage: UITextField!
    
    @IBOutlet weak var txtTipAmount: UILabel!
    
    @IBOutlet weak var txtTotalCost: UILabel!
    
    var mealCost = "0"
    var tipPercentage = "0"
    
    var totalTip : Float = 0.0
    var totalMealCost : Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnCalculate(sender: UIButton) {
        calculateTip()
    }

    @IBAction func btnClear(sender: UIButton) {
        clear()
    }
    
    func calculateTip() {
        
        mealCost = txtMealCost.text!
        tipPercentage = txtTipPercentage.text!
        
       let fMealCost = Float(mealCost)
       let fTipPercentage = Float(tipPercentage)
        
        totalTip = fMealCost! * (fTipPercentage!/100)
        totalMealCost = totalTip + fMealCost!
        hideKeyBoards()
        printTip()

    }
    
    func printTip(){
        
        let formatTip = String(format: "%0.2f", totalTip)
        let formatTotal = String(format: "%0.2f", totalMealCost)
        txtTipAmount.text = "Tip: $\(formatTip)"
        txtTotalCost.text = "$\(formatTotal)"
    }
    
    func clear() {
        
        txtMealCost.text = ""
        txtTipPercentage.text = ""
        
        txtTipAmount.text = "Tip: $0.00"
        txtTotalCost.text = "$0.00"
        hideKeyBoards()
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        hideKeyBoards()
    }
    func hideKeyBoards() {
        txtMealCost.resignFirstResponder()
        txtTipPercentage.resignFirstResponder()
    }
}


