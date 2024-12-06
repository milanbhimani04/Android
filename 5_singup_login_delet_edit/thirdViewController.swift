//
//  thirdViewController.swift
//  task5
//
//  Created by student on 22/11/24.
//  Copyright © 2024 student. All rights reserved.
//

import UIKit
import CoreData

class thirdViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var arr = [NSManagedObject]()
    @IBOutlet weak var tblData: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDel=UIApplication.shared.delegate as! AppDelegate
        let context=appDel.persistentContainer.viewContext
        
        let req = NSFetchRequest<NSManagedObject>(entityName: "Login")
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        tblData.reloadData()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arr.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier:"tblViewCell", for: indexPath) as! tblViewCell
        
        var singlePath=arr[indexPath.row]
        cell.tName.text = singlePath.value(forKey: "name") as! String
        cell.tAddress.text = singlePath.value(forKey: "address") as! String
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        let appDel=UIApplication.shared.delegate as! AppDelegate
        let context=appDel.persistentContainer.viewContext
        
        context.delete(arr[indexPath.row])
        do {
            try context.save()
        } catch let err as NSError {
            print(err)
        }
        
        arr.remove(at: indexPath.row)
        tableView.reloadData()
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let appDel=UIApplication.shared.delegate as! AppDelegate
        appDel.selectedIndex = arr[indexPath.row]
        self.performSegue(withIdentifier: "editpage", sender: self)
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
