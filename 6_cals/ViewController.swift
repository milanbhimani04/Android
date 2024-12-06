//
//  ViewController.swift
//  task6
//
//  Created by student on 22/11/24.
//  Copyright © 2024 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var answer = 0
    var num1 = ""
    var num2 =  ""
    var add = false
    var sub = false
    var mul = false
    var div = false
    
    @IBOutlet weak var display: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func add(_ sender: Any) {
        add = true
        sub = false
        mul = false
        div = false
    }
    
    @IBAction func subtract(_ sender: Any) {
        add = false
        sub = true
        mul = false
        div = false
    }
    
    @IBAction func multiplication(_ sender: Any) {
        add = false
        sub = false
        mul = true
        div = false
    }
    
    @IBAction func div(_ sender: Any) {
        add = false
        sub = false
        mul = false
        div = true
    }
    
    @IBAction func clear(_ sender: Any) {
        display.text=""
        num1=""
        num2=""
    }
    
    @IBAction func ans(_ sender: Any) {
        if(add == true){
            answer = Int(num1)! + Int(num2)!
            display.text = String(answer)
        }
        if(sub == true){
            answer = Int(num1)! - Int(num2)!
            display.text = String(answer)
        }
        if(mul == true){
            answer = Int(num1)! * Int(num2)!
            display.text = String(answer)
        }
        if(div == true){
            answer = Int(num1)! / Int(num2)!
            display.text = String(answer)
        }
        num1 = String(answer)
        num2 = ""
        add = false
         sub = false
         mul = false
         div = false

     
    }
    
    @IBAction func zero(_ sender: Any) {
        if(add == true || sub == true || mul == true || div == true){
            num2 = "\(num2)0"
            display.text = num2
        }else{
            num1 = "\(num1)0"
            display.text = num1
        }
    }
    
    @IBAction func one(_ sender: Any) {
        if(add == true || sub == true || mul == true || div == true){
            num2 = "\(num2)1"
            display.text = num2
        }else{
            num1 = "\(num1)1"
            display.text = num1
        }
    }
    
    @IBAction func two(_ sender: Any) {
        if(add == true || sub == true || mul == true || div == true){
            num2 = "\(num2)2"
            display.text = num2
        }else{
            num1 = "\(num1)2"
            display.text = num1
        }
    }
    
    @IBAction func three(_ sender: Any) {
        if(add == true || sub == true || mul == true || div == true){
            num2 = "\(num2)3"
            display.text = num2
        }else{
            num1 = "\(num1)3"
            display.text = num1
        }
    }
    
    @IBAction func four(_ sender: Any) {
        if(add == true || sub == true || mul == true || div == true){
            num2 = "\(num2)4"
            display.text = num2
        }else{
            num1 = "\(num1)4"
            display.text = num1
        }
    }
    
    @IBAction func five(_ sender: Any) {
        if(add == true || sub == true || mul == true || div == true){
            num2 = "\(num2)5"
            display.text = num2
        }else{
            num1 = "\(num1)5"
            display.text = num1
        }
    }
    
    @IBAction func six(_ sender: Any) {
        if(add == true || sub == true || mul == true || div == true){
            num2 = "\(num2)6"
            display.text = num2
        }else{
            num1 = "\(num1)6"
            display.text = num1
        }
    }
    
    @IBAction func seven(_ sender: Any) {
        if(add == true || sub == true || mul == true || div == true){
            num2 = "\(num2)7"
            display.text = num2
        }else{
            num1 = "\(num1)7"
            display.text = num1
        }
    }
    
    @IBAction func eight(_ sender: Any) {
        if(add == true || sub == true || mul == true || div == true){
            num2 = "\(num2)8"
            display.text = num2
        }else{
            num1 = "\(num1)8"
            display.text = num1
        }
    }
    
    @IBAction func nine(_ sender: Any) {
        if(add == true || sub == true || mul == true || div == true){
            num2 = "\(num2)9"
            display.text = num2
        }else{
            num1 = "\(num1)9"
            display.text = num1
        }
    }
    
    
}

