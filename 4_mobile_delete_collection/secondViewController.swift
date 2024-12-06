//
//  secondViewController.swift
//  fourth_task
//
//  Created by student on 21/11/24.
//  Copyright © 2024 student. All rights reserved.
//

import UIKit
import CoreData

class secondViewController: UIViewController {

    @IBOutlet weak var mobName: UITextField!
    var arr = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDel = UIApplication.shared.delegate as! AppDelegate
        let context = appDel.persistentContainer.viewContext
        
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "Mobile")
        
        do {
            try arr = context.fetch(req) as! [NSManagedObject]
        } catch let err as NSError {
            print(err)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func deleteMobile(_ sender: Any) {
        let appDel = UIApplication.shared.delegate as! AppDelegate
        let context = appDel.persistentContainer.viewContext
        
        for i in arr{
            if(mobName.text==i.value(forKey: "mobname") as! String){
                context.delete(i)
            }
        }
    }
    
    @IBAction func viewRecords(_ sender: Any) {
        self.performSegue(withIdentifier: "thirdPage", sender: self)
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
