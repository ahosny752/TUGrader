//
//  ViewController.swift
//  TUGrader
//
//  Created by Ahmed Hosny on 8/9/18.
//  Copyright © 2018 Ahmed Hosny. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var test1: UITextField!
    @IBOutlet weak var test2: UITextField!
    @IBOutlet weak var test3: UITextField!
    @IBOutlet weak var calculate: UIButton!
    @IBOutlet weak var outputLabel: UITextView!

//    when clear button is pressed, reset all fields and labels
    @IBAction func clearContents(_ sender: UIButton) {
        self.test1.text = nil
        self.test2.text = nil
        self.test3.text = nil
        self.outputLabel.text = nil
        calculate.isEnabled = false

    }
//    calculate grade function
    @IBAction func calculateGrade(_ sender: UIButton) {
        
        let yourGrade = ("Your final grade is: ")
        let passed = ("Congrats! AJ says you Passed! ")
        let wontPass = ("Bummer, AJ says you wont pass. ")
        let honors = ("Congrats, AJ says you got an A! ")
        
        let gradeOne = Float(test1.text!)
        let gradeTwo = Float(test2.text!)
        let gradeThree = Float(test3.text!)
        let total = gradeOne! + gradeTwo! + gradeThree!
        let average = total / 3
        var finalGrade = ""
        
        if (average < 72.5) {
            finalGrade = "\(wontPass)\(yourGrade)\(average)"
        }
        else if average > 90 {
            
            finalGrade = "\(honors)\(yourGrade)\(average)"
            }

        else {
            finalGrade = "\(passed)\(yourGrade)\(average)"
        }
        outputLabel.text = finalGrade
    }

    
//    declaring textfield delegate
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.test1.delegate = self
        self.test2.delegate = self
        self.test3.delegate = self

    }
    
    
//    If text fields are empty disable the button
    func checkField(sender: AnyObject) {
        if (test1.text?.isEmpty)! || (test2.text?.isEmpty)! || (test3.text?.isEmpty)! || (test3.text?.isEmpty)!
        {
            calculate.isEnabled = false
            
        }
        else {
            calculate.isEnabled = true
        }
    }
    
     
//    when text is done editing, call the check field function
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkField(sender: UITextField.self)
    }
    
//  when user touches outside, keyboard is hidden
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
//    when user touches return keyboard is hidden
    func textFieldShouldReturn(_ test1: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}









