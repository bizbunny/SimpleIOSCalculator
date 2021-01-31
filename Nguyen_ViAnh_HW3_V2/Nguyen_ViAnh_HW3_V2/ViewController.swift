//
//  ViewController.swift
//  Nguyen_ViAnh_HW3_V2
//
//  Created by Anh Nguyen on 1/20/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var label: UILabel!
    
    var num1OnScreen: Double = 0;
    var prevNum1OnScreen: Double = 0;
    var performingMath = false;
    var operation = 0;
    
    @IBAction func numbers(_ sender: UIButton) {
        if performingMath == true {
            label.text = String(sender.tag-1)
            num1OnScreen = Double(label.text!)!
            performingMath = false
        }
        else {
            label.text = label.text! + String(sender.tag-1)
            num1OnScreen = Double(label.text!)!
        }
    }
    
    @IBAction func PerformMath(_ sender: UIButton) {
        //do math here
        if label.text != "" && sender.tag != 15 && sender.tag != 16 {
            prevNum1OnScreen = Double(label.text!)!
            if sender.tag == 11 {
                //add
                label.text = "+";
            }
            else if sender.tag == 12 {
                //subtract
                label.text = "-";
            }
            else if sender.tag == 13 {
                //divide
                label.text = "/";
            }
            else if sender.tag == 14 {
                //multiply
                label.text = "*";
            }
            operation = sender.tag
            performingMath = true;
        }
        else if sender.tag == 15 {
            //finish with the =
            if operation == 11 {
                label.text = String(prevNum1OnScreen + num1OnScreen)//addition
            }
            else if operation == 12 {
                label.text = String(prevNum1OnScreen - num1OnScreen)//subtraction
            }
            else if operation == 13 {
                label.text = String(prevNum1OnScreen / num1OnScreen)//division
            }
            else if operation == 14 {
                label.text = String(prevNum1OnScreen * num1OnScreen)//division
            }
        }
        else if sender.tag == 16 {
            //clear
            label.text = ""
            num1OnScreen = 0;
            prevNum1OnScreen = 0;
            operation = 0;
        }
    }
}

