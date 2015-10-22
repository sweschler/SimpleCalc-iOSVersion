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
    var shouldBeCleared: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func fact(n: Double) -> Double {
        if n == 0 {
            return 1
        } else {
            return n * fact(n-1)
        }
    }
    
    var traditional: Bool = true
    
    @IBAction func RPNFunctionality(sender: UISwitch) {
        //The RPN calculator is on when the switch is off
        traditional = sender.on
        AC()
    }
    
    func AC() {
        self.display.text = "0"
        self.number1 = 0
        self.number2 = 0
        op = ""
        shouldBeCleared = false
    }
    
    func traditionalVersion(sender: UIButton) {
        //When the function is not =, number in the display is stored as number1. Then the display is cleared.
        if sender.titleLabel!.text! != "=" {
            self.number1 = Double(self.display.text!)!
            self.shouldBeCleared = true
        }
        switch sender.titleLabel!.text! {
        case "AC":
            AC()
        case "AVG":
            self.op = "AVG"
            //adding every number diplayed to variable number2
            number2 += Double(self.display.text!)!
            count += 1
        case "COUNT":
            self.op = "COUNT"
            count += 1
        case "FACT":
            self.display.text! = "\(fact(number1))"
            
            //The spec states that, for example, 2 + 3 = 5 is the format that the user will input. I am assuming this will be true for mod, divide, multiply, subtract and add operations. If more are entered, it will take the last two numbers that are sandwiched between the operation and before the = button is pressed and calculate the results.
        case "%":
            self.op = "%"
        case "/":
            self.op = "/"
        case "*":
            self.op = "*"
        case "-":
            self.op = "-"
        case "+":
            self.op = "+"
        case "=":
            if self.op != "AVG" {
                number2 = Double(self.display.text!)!
            } else {
                number2 += Double(self.display.text!)!
            }
            var output: Double = 0
            switch op {
            case "AVG":
                //In this case number2 is collecting the sum
                output = (number2) / (count + 1)
                count = 0
                number2 = 0
            case "COUNT":
                output = count + 1
                count = 0
            case "%":
                output = number1 % number2
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
            self.shouldBeCleared = true
            default:
                break
        }

    }
    
    var RPNArr: [Double] = []
    var total: Double = 0
    //The RPN calculator function
    func RPNVersion(sender: UIButton) {
        
        
        RPNArr.append(Double(self.display.text!)!)
        if sender.titleLabel!.text! == "=" {
            self.shouldBeCleared = true
        } else {
            switch sender.titleLabel!.text! {
                case "AC":
                    AC()
                case "+":
                    total = RPNArr.reduce(0, combine: +)
                    self.display.text! = ("\(total)")
                case "-":
                    total = RPNArr[0]
                    for num in 1...(RPNArr.count - 1) {
                        total -= RPNArr[num]
                    }
                    self.display.text! = ("\(total)")
                case "/":
                    total = RPNArr[0]
                    for num in 1...(RPNArr.count - 1) {
                        total /= RPNArr[num]
                    }
                    self.display.text! = ("\(total)")
                case "*":
                    total = RPNArr.reduce(1, combine: *)
                    self.display.text! = ("\(total)")

                default:
                    break

            }
            RPNArr = []
            self.shouldBeCleared = true
        }
        
    }
    
    var count: Double = 0
    var number2: Double = 0
    
    //When a function button is clicked
    @IBAction func didSelectFunction(sender: UIButton) {
        if traditional {
            traditionalVersion(sender)
        } else {
            RPNVersion(sender)
        }
    }

    @IBAction func didSelectNumber(sender: UIButton) {
        if self.display.text! == "0" {
            self.display.text! = ""
        }
        if shouldBeCleared {
            self.display.text! = ""
            self.shouldBeCleared = false
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

