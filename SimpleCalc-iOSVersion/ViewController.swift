//
//  ViewController.swift
//  SimpleCalc-iOSVersion
//
//  Created by Sabrina Weschler on 10/20/15.
//  Copyright © 2015 Sabrina Weschler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var display: UILabel!
    
    var number1: Double = 0.0
    var op: String = ""
    var reset: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fact(n: Double) -> Double {
        if n == 0 {
            return 1
        } else {
            return n * fact(n-1)
        }
    }

    @IBAction func didSelectFunction(sender: UIButton) {
        if sender.titleLabel!.text! != "=" {
            self.number1 = Double(self.display.text!)!
            self.reset = true
        }
        switch sender.titleLabel!.text! {
            case "AC":
                self.display.text! = "0"
                number1 = 0
                op = ""
                reset = false
            case "AVG":
                self.op = "AVG"
            case "COUNT":
                self.display.text! = "\(self.display.text!.characters.count)"
                number1 = 0
            case "FACT":
                self.display.text! = "\(fact(number1))"
            case "/":
                self.op = "/"
            case "*":
                self.op = "*"
            case "-":
                self.op = "-"
            case "+":
                self.op = "+"
            case "=":
                let number2 = Double(self.display.text!)!
                var output: Double = 0
                switch op {
                    case "AVG":
                        output = (number1 + number2) / 2.0
                    case "/":
                        output = number1 / number2
                    case "*":
                        output = number1 * number2
                    case "+":
                        output = number1 + number2
                    case "-":
                        output = number1 - number2
                    default:
                        break
            }
            self.display.text! = ("\(output)")
            default:
                break
        }
    }

    @IBAction func didSelectNumber(sender: UIButton) {
        if self.display.text! == "0" {
            self.display.text! = ""
        } else if reset {
            self.display.text! = ""
            self.reset = false
        }
        switch sender.titleLabel!.text! {
            case "0":
                self.display.text! += "0"
            case "1":
                self.display.text! += "1"
            case "2":
                self.display.text! += "2"
            case "3":
                self.display.text! += "3"
            case "4":
                self.display.text! += "4"
            case "5":
                self.display.text! += "5"
            case "6":
                self.display.text! += "6"
            case "7":
                self.display.text! += "7"
            case "8":
                self.display.text! += "8"
            case "9":
                self.display.text! += "9"
            case ".":
                if self.display.text!.rangeOfString(".") == nil {
                    self.display.text! += "."
                }
            default:
                break
        }
    }
}

