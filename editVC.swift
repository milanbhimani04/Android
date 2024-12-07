//
//  editVC.swift
//  practicecurd
//
//  Created by ENGRAVER FAMILY on 06/12/24.
//

import UIKit
import CoreData

class editVC: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var surname: UITextField!
    
    var arr = [NSManagedObject]()
    
    let appdel = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text = appdel.selectedindex?.value(forKey: "name") as! String
        surname.text = appdel.selectedindex?.value(forKey: "surname") as! String
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func savebrn(_ sender: Any) {
        
        let context = appdel.persistentContainer.viewContext
        
        appdel.selectedindex?.setValue(name.text, forKey: "name") as? String
        
        appdel.selectedindex?.setValue(surname.text, forKey: "surname") as? String
        
        
        do {
            try context.save()
        } catch let err as NSError {
            print(err)
        }
        
        self.navigationController?.popViewController(animated: true)
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
