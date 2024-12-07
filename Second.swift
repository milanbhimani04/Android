//
//  Second.swift
//  practicecurd
//
//  Created by ENGRAVER FAMILY on 06/12/24.
//

import UIKit
import CoreData

class Second: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableview: UITableView!
    
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableview.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arr.count
    }

   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var cell = tableView.dequeueReusableCell(withIdentifier: "tblcell", for: indexPath) as! tblcell
        
        var counter = arr[indexPath.row]
        cell.name.text = counter.value(forKey: "name") as? String
        cell.surname.text = counter.value(forKey: "surname") as? String
        return cell
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let appdel = UIApplication.shared.delegate as! AppDelegate
        let context = appdel.persistentContainer.viewContext
        
        appdel.selectedindex = arr[indexPath.row]
        self.performSegue(withIdentifier: "edit", sender: self)
        

    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let appdel = UIApplication.shared.delegate as! AppDelegate
        let context = appdel.persistentContainer.viewContext
        
        context.delete(arr[indexPath.row])
        arr.remove(at: indexPath.row)
        do {
            try context.save()
        } catch let error as NSError {
            print(error)
        }
        tableView.reloadData();
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
