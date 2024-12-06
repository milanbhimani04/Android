//
//  fourthViewController.swift
//  task5
//
//  Created by student on 22/11/24.
//  Copyright © 2024 student. All rights reserved.
//

import UIKit

class fourthViewController: UIViewController {

    @IBOutlet weak var tname: UITextField!
    @IBOutlet weak var temail: UITextField!
    @IBOutlet weak var taddress: UITextField!
    @IBOutlet weak var tpassword: UITextField!
    
    
    let appdel = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tname.text = appdel.selectedIndex?.value(forKey: "name") as? String
        taddress.text = appdel.selectedIndex?.value(forKey: "address") as? String
        temail.text = appdel.selectedIndex?.value(forKey: "email") as? String
        tpassword.text = appdel.selectedIndex?.value(forKey: "password") as? String

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updateUser(_ sender: Any) {
        
        let context = appdel.persistentContainer.viewContext
        
        appdel.selectedIndex?.setValue(tpassword.text, forKey: "password")
        appdel.selectedIndex?.setValue(tname.text, forKey: "name")
        appdel.selectedIndex?.setValue(temail.text, forKey: "email")
        appdel.selectedIndex?.setValue(taddress.text, forKey: "address")
        
        do {
            try context.save()
        } catch let err as NSError{
            print(err)
        }
        
        self.navigationController?.popViewController(animated: true)
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
