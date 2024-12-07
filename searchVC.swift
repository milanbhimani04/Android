//
//  searchVC.swift
//  practicecurd
//
//  Created by ENGRAVER FAMILY on 06/12/24.
//

import UIKit
import CoreData

class searchVC: UIViewController {

    @IBOutlet weak var searchname: UITextField!
    @IBOutlet weak var display: UITextView!
    
    var arr = [NSManagedObject]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appdel = UIApplication.shared.delegate as! AppDelegate
        let context = appdel.persistentContainer.viewContext
        
        let req = NSFetchRequest<NSManagedObject>(entityName: "Student")
        // Do any additional setup after loading the view.
        
        do {
            try arr = context.fetch(req)
        } catch let error as NSError {
            print(error)
        }
        
        print(arr.count)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func searchbtn(_ sender: Any) {
        
        for i in arr {
            if (searchname.text == i.value(forKey: "name")as! String){
                display.text = "name :\(i.value(forKey:"name")as! String)\n age : \(i.value(forKey:"age")as! Int)"
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
