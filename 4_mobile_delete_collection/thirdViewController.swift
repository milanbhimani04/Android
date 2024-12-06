//
//  thirdViewController.swift
//  fourth_task
//
//  Created by student on 21/11/24.
//  Copyright © 2024 student. All rights reserved.
//

import UIKit
import CoreData

class thirdViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var collectionData: UICollectionView!
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
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return arr.count
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionView", for: indexPath) as! collectionView
        
        let des = arr[indexPath.row]
        
        cell.mobName.text = des.value(forKey: "mobname") as! String
        cell.mobCompany.text = des.value(forKey: "mobcompany") as! String
        cell.mobRating.text = des.value(forKey: "mobrating") as! String
        cell.mobPrice.text = des.value(forKey: "mobprice") as! String
        
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
