//
//  secondViewController.swift
//  firstTask
//
//  Created by student on 13/11/24.
//  Copyright © 2024 student. All rights reserved.
//

import UIKit
import CoreData
class secondViewController: UIViewController {

    @IBOutlet weak var company: UITextField!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var displayBike: UITextView!
    
    var getRecord = ""
    
    var bikeArr = [NSManagedObject]()
    var mRecord = [NSManagedObject]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDel = UIApplication.shared.delegate as! AppDelegate!
        
        let context = appDel?.persistentContainer.viewContext
        
        let req = NSFetchRequest<NSManagedObject>(entityName: "Bike")
        
        do {
            try bikeArr = (context?.fetch(req))!
        } catch let err as NSError {
            print(err)
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func searchBike(_ sender: Any) {
        for i in bikeArr{
            if(company.text==i.value(forKey: "bcompany") as? String && price.text==i.value(forKey: "bprice") as? String){
                mRecord.append(i)
                getRecord+=i.value(forKey: "bname") as! String
                getRecord+="\t"
                getRecord+=i.value(forKey: "bcompany") as! String
                getRecord+="\t"
                getRecord+=i.value(forKey: "bprice") as! String
                getRecord+="\t"
                getRecord+=i.value(forKey: "bavg") as! String
                getRecord+="\n\n"
            }
        }
        displayBike.text = getRecord
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let seg = segue.destination as! thirdViewController
        seg.arr = mRecord
    }
    @IBAction func navigatePage(_ sender: Any) {
        self.performSegue(withIdentifier: "thirdPage", sender: self)
    }
}
