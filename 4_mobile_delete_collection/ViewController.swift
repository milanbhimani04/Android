//
//  ViewController.swift
//  fourth_task
//
//  Created by student on 21/11/24.
//  Copyright © 2024 student. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var mobName: UITextField!
    @IBOutlet weak var mobPrice: UITextField!
    @IBOutlet weak var mobCompany: UITextField!
    @IBOutlet weak var mobRating: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveMobile(_ sender: Any) {
        let appDel = UIApplication.shared.delegate as! AppDelegate
        let context = appDel.persistentContainer.viewContext
        
        let tblMobile = NSEntityDescription.entity(forEntityName: "Mobile", in: context)
        
        let mobObj = NSManagedObject(entity: tblMobile!, insertInto: context)
        
        mobObj.setValue(mobName.text, forKey: "mobname")
        mobObj.setValue(mobPrice.text, forKey: "mobprice")
        mobObj.setValue(mobCompany.text, forKey: "mobcompany")
        mobObj.setValue(mobRating.text, forKey: "mobrating")
        
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

