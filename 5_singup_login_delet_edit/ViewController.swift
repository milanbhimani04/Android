//
//  ViewController.swift
//  task5
//
//  Created by student on 22/11/24.
//  Copyright © 2024 student. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    var arr = [NSManagedObject]()
    
    @IBOutlet weak var temail: UITextField!
    @IBOutlet weak var tpass: UITextField!
    @IBOutlet weak var msg: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDel=UIApplication.shared.delegate as! AppDelegate
        let context=appDel.persistentContainer.viewContext
        
        let req = NSFetchRequest<NSManagedObject>(entityName: "Login")
        
        do {
            try arr = context.fetch(req)
        } catch let err as NSError {
            print(err)
        }
        
        print(arr.count)
        print(arr[0].value(forKey: "email") as! String)
        print(arr[0].value(forKey: "password") as! String)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func login(_ sender: Any) {
        for i in arr{
            if (temail.text == i.value(forKey: "email") as! String) {
                if (tpass.text == i.value(forKey: "password") as! String) {
                    self.performSegue(withIdentifier: "loginPage", sender: self)
                    print(i.value(forKey: "email") as! String)
                    print(i.value(forKey: "password") as! String)
                }else{
                    msg.text = "Invalid Password!!"
                    msg.textColor = UIColor.red
                }
            }else{
                msg.text = " User not found!!"
                msg.textColor = UIColor.red
            }
            
        }
    }
    
    @IBAction func signUp(_ sender: Any) {
        self.performSegue(withIdentifier: "signUpPage", sender: self)
    }
    

}

