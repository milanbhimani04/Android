//
//  secondViewController.swift
//  task5
//
//  Created by student on 22/11/24.
//  Copyright © 2024 student. All rights reserved.
//

import UIKit
import CoreData

class secondViewController: UIViewController {

    @IBOutlet weak var tname: UITextField!
    @IBOutlet weak var temail: UITextField!
    @IBOutlet weak var taddress: UITextField!
    @IBOutlet weak var tpassword: UITextField!
    @IBOutlet weak var msg: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var signUpUser: UIButton!
    
    
    @IBAction func register(_ sender: Any) {
        let appDel=UIApplication.shared.delegate as! AppDelegate
        let context=appDel.persistentContainer.viewContext
        
        let tbluser = NSEntityDescription.entity(forEntityName: "Login", in: context)
        
        let userobject = NSManagedObject(entity: tbluser!, insertInto: context)
        
        
        if tname.text == "" || tpassword.text == "" || taddress.text == "" || temail.text == "" {
            
            msg.text = "All fields are required !!"
            msg.textColor = UIColor.red
        }else{
            userobject.setValue(tname.text!, forKey: "name")
            userobject.setValue(temail.text!, forKey: "email")
            userobject.setValue(tpassword.text!, forKey: "password")
            userobject.setValue(taddress.text!, forKey: "address")
            do {
                try context.save()
            } catch let err as NSError {
                print(err)
            }
            
            
            self.navigationController?.popViewController(animated: true)
        }

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
