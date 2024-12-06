//
//  ViewController.swift
//  practical3
//
//  Created by student on 18/11/24.
//  Copyright © 2024 student. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var pname: UITextField!
    @IBOutlet weak var page: UITextField!
    @IBOutlet weak var pteam: UITextField!
    @IBOutlet weak var pweight: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addData(_ sender: Any) {
        let appDel = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDel.persistentContainer.viewContext
        
        let tblplayer = NSEntityDescription.entity(forEntityName: "Player", in: context)
        
        let playerobj = NSManagedObject(entity: tblplayer!, insertInto: context)
        
        playerobj.setValue(pname.text, forKey: "pname")
        playerobj.setValue(Int(page.text!), forKey: "page")
        playerobj.setValue(pteam.text, forKey: "pteam")
        playerobj.setValue(pweight.text, forKey: "pweight")
        do {
            try context.save()
        } catch let err as NSError {
            print(err)
        }

    }

    @IBAction func nextpage(_ sender: Any) {
        self.performSegue(withIdentifier: "secpage", sender: self)
    }
}

