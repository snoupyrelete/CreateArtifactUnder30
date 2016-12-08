//
//  ViewController.swift
//  CreateArtifactUnder30
//
//  Created by Robson, Dylan on 12/8/16.
//  Copyright © 2016 Robson, Dylan. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    let defaultTips = [0.10, 0.15, 0.20]
    
    @IBOutlet weak var cost: UITextField!
    @IBOutlet weak var tip: UITextField!
    @IBOutlet weak var tax: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipSegment: UISegmentedControl!
    @IBAction func defaultTipSegmentChanged(_ sender: Any)
    {
        if tipSegment.selectedSegmentIndex != 3
        {
            tip.isHidden = true
            //tip = defaultTips[tipSegment.selectedSegmentIndex]
        }
        else
        {
            tip.isHidden = false
        }
    }

    @IBAction func calculateButtonPressed(_ sender: Any)
    {
        let cost: Float = Float(self.cost.text!.replacingOccurrences(of: "$", with: ""))!
        var tip: Float = Float(self.tip.text!.replacingOccurrences(of: "%", with: ""))!
        var tax: Float = Float(self.tax.text!.replacingOccurrences(of: "%", with: ""))!
        
        if tip > 1
        {
            tip = tip * 0.01
        }
        
        if tax > 1
        {
            tax = tax * 0.01
        }
        
        let totalTip = calculateTip(cost: cost, tip: tip)
        let totalTax = calculateTax(cost: cost, tax: tax)
        
        tipLabel.text = "Tip: $\(String(totalTip))"
        totalLabel.text = "Total: $\(String(totalTip + cost + totalTax))"
        
    }
    

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tip.isHidden = false

    }
    
    func calculateTip(cost: Float, tip: Float) -> Float
    {
        var totalTip: Float = 0.0
        
        totalTip = cost * tip
        
        return totalTip
    }
    
    func calculateTax(cost: Float, tax: Float) -> Float
    {
        var totalTax: Float = 0.0
        
        totalTax = cost * tax
        
        return totalTax
    }
}

