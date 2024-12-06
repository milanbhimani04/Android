//
//  thirdViewController.swift
//  task2
//
//  Created by student on 13/11/24.
//  Copyright © 2024 student. All rights reserved.
//

import UIKit
import CoreData

class thirdViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var arr = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDel = UIApplication.shared.delegate as! AppDelegate
        let context = appDel.persistentContainer.viewContext
        
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "Car")
        
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
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
       return arr.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var cell = tableView.dequeueReusableCell(withIdentifier: "tblViewCell", for: indexPath) as! tblViewCell
        
        let des = arr[indexPath.row]
        
        cell.carName.text = des.value(forKey: "cname") as! String
        
        cell.carPrice.text = des.value(forKey: "cprice") as! String
        
        return cell
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
