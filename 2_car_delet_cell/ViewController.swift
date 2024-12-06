//
//  ViewController.swift
//  task2
//
//  Created by student on 13/11/24.
//  Copyright © 2024 student. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var cname: UITextField!
    @IBOutlet weak var cprice: UITextField!
    @IBOutlet weak var ccompnay: UITextField!
    @IBOutlet weak var cavg: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveCar(_ sender: Any) {
        let appDel = UIApplication.shared.delegate as! AppDelegate
        let context = appDel.persistentContainer.viewContext
        
        let tblCar = NSEntityDescription.entity(forEntityName: "Car", in: context)
        
        let carObj = NSManagedObject(entity: tblCar!, insertInto: context)
        
        carObj.setValue(cname.text, forKey: "cname")
        carObj.setValue(cprice.text, forKey: "cprice")
        carObj.setValue(ccompnay.text, forKey: "ccompany")
        carObj.setValue(cavg.text, forKey: "cavg")
        
        do {
            try context.save()
        } catch let err as NSError {
            print(err)
        }
    }
    
    
    @IBAction func nextPage(_ sender: Any) {
        self.performSegue(withIdentifier: "secondPage", sender: self)
    }

}

