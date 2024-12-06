//
//  ViewController.swift
//  firstTask
//
//  Created by student on 13/11/24.
//  Copyright © 2024 student. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var company: UITextField!
    @IBOutlet weak var avg: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var saveBike: UIButton!
    
    @IBAction func saveBike(_ sender: Any) {
        let appDel = UIApplication.shared.delegate as! AppDelegate
        let context = appDel.persistentContainer.viewContext
        
        let tblBike = NSEntityDescription.entity(forEntityName: "Bike", in: context)
        
        let bikeObj = NSManagedObject(entity: tblBike!, insertInto: context)
        
        bikeObj.setValue(price.text, forKey: "bprice")
        bikeObj.setValue(name.text, forKey: "bname")
        bikeObj.setValue(company.text, forKey: "bcompany")
        bikeObj.setValue(avg.text, forKey: "bavg")
        
        do {
            try context.save()
        } catch let err as NSError {
            print(err)
        }
    }
    
    @IBOutlet weak var nextPage: UIButton!
    
    
    @IBAction func nextPage(_ sender: Any) {
        
        self.performSegue(withIdentifier: "secondPage", sender: self)
    }
    
    

}

