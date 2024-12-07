//
//  ViewController.swift
//  practicecurd
//
//  Created by ENGRAVER FAMILY on 06/12/24.

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var genderMF = ""
    var stream = ""
    var ages = 0

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var surname: UITextField!
    @IBOutlet weak var age: UISlider!
    
    @IBOutlet weak var Stream: UISegmentedControl!
    @IBOutlet weak var gender: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showage(_ sender: Any) {
        ages = Int(age.value)
    }
    @IBAction func showstream(_ sender: Any) {
        if (Stream.selectedSegmentIndex == 0){
            stream = "MSCIT"
        }else{
            stream = "MCA"
        }
    }
    @IBAction func showgender(_ sender: Any) {
        if (gender.isOn){
            genderMF = "MALE"
        }else{
            genderMF = "FEMALE"
        }
    }
    @IBAction func save(_ sender: Any) {
        
        let appdel = UIApplication.shared.delegate as! AppDelegate
        let context = appdel.persistentContainer.viewContext
        
        let table = NSEntityDescription.entity(forEntityName: "Student", in: context)
        
        let obj = NSManagedObject(entity: table!, insertInto: context)
        
        obj.setValue(name.text, forKey: "name")
        obj.setValue(surname.text, forKey: "surname")
        obj.setValue(ages, forKey: "age")
        obj.setValue(stream, forKey: "stream")
        obj.setValue(genderMF, forKey: "gender")
        
        do {
            try context.save()
        } catch let Error as NSError {
            print(Error)
        }
    }
    @IBAction func next(_ sender: Any) {
        self.performSegue(withIdentifier: "secondVC", sender: self)
    }
    
    @IBAction func searchbtn(_ sender: Any) {
        self.performSegue(withIdentifier: "search", sender: self)
    }
    
}

