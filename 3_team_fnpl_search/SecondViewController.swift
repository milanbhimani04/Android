//
//  SecondViewController.swift
//  practical3
//
//  Created by student on 18/11/24.
//  Copyright © 2024 student. All rights reserved.
//

import UIKit
import CoreData

class SecondViewController: UIViewController {
    
    var arr = [NSManagedObject]()
    var temp = [NSManagedObject]()
    var counter = 0
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var team: UITextField!
    @IBOutlet weak var countnumber: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDel = UIApplication.shared.delegate as! AppDelegate
        let context =  appDel.persistentContainer.viewContext
        
        let req = NSFetchRequest <NSManagedObject>(entityName: "Player")
        
        do {
            try arr = context.fetch(req)
        } catch let err as NSError {
            print(err)
        }
        print(arr.count)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func search(_ sender: Any) {
        for i in arr{
            if (Int(age.text!)! <= i.value(forKey: "page") as! Int  && team.text! == i.value(forKey: "pteam") as! String) {
                counter = counter + 1
                temp.append(i)
            }
        }
        
        countnumber.text = String(counter)
        counter = 0
    }
    @IBAction func nextpage(_ sender: Any) {
        
        self.performSegue(withIdentifier: "thirdpage", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! ThirdViewController
        dest.arr = temp
        
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
