//
//  ThirdViewController.swift
//  practical3
//
//  Created by student on 18/11/24.
//  Copyright © 2024 student. All rights reserved.
//

import UIKit
import CoreData
class ThirdViewController: UIViewController {
    
    var arr = [NSManagedObject]()
    var counter = 0
    var displaystring = ""

    @IBOutlet weak var showdata: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(arr[0].value(forKey: "page") as! Int)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func firstbtn(_ sender: Any) {
        
        displaystring += "Player name: \(arr[0].value(forKey: "pname") as! String) \n, player age: \(arr[0].value(forKey: "page") as! Int)\n , Player team : \(arr[0].value(forKey: "pteam") as! String)\n,Player weight : \(arr[0].value(forKey: "pweight") as! String) \n"
        
        showdata.text = displaystring
        counter = 0
        displaystring = ""

    }
    @IBAction func prevbtn(_ sender: Any) {
        if(counter == 0)
        {
            counter = arr.count - 1

            displaystring += "Player name: \(arr[counter].value(forKey: "pname") as! String) \n, player age: \(arr[counter].value(forKey: "page") as! Int)\n , Player team : \(arr[counter].value(forKey: "pteam") as! String)\n,Player weight : \(arr[counter].value(forKey: "pweight") as! String) \n"
            
            showdata.text = displaystring
                        displaystring = ""
        }else{
              counter = counter - 1
            displaystring += "Player name: \(arr[counter].value(forKey: "pname") as! String) \n, player age: \(arr[counter].value(forKey: "page") as! Int)\n , Player team : \(arr[counter].value(forKey: "pteam") as! String)\n,Player weight : \(arr[counter].value(forKey: "pweight") as! String) \n"
            
            showdata.text = displaystring
          
            displaystring = ""
        }
        
    }
    @IBAction func nextbtn(_ sender: Any) {
        if(counter == arr.count - 1)
        {
            counter = 0
            displaystring += "Player name: \(arr[counter].value(forKey: "pname") as! String) \n, player age: \(arr[counter].value(forKey: "page") as! Int)\n , Player team : \(arr[counter].value(forKey: "pteam") as! String)\n,Player weight : \(arr[counter].value(forKey: "pweight") as! String) \n"
            
            showdata.text = displaystring
            
            displaystring = ""
        }else{
             counter = counter + 1
            displaystring += "Player name: \(arr[counter].value(forKey: "pname") as! String) \n, player age: \(arr[counter].value(forKey: "page") as! Int)\n , Player team : \(arr[counter].value(forKey: "pteam") as! String)\n,Player weight : \(arr[counter].value(forKey: "pweight") as! String) \n"
            
            showdata.text = displaystring
           
            displaystring = ""
        }

    }
    @IBAction func lastbtn(_ sender: Any) {
        

        displaystring += "Player name: \(arr[arr.count - 1].value(forKey: "pname") as! String) \n, player age: \(arr[arr.count - 1].value(forKey: "page") as! Int)\n , Player team : \(arr[arr.count - 1].value(forKey: "pteam") as! String)\n,Player weight : \(arr[arr.count - 1].value(forKey: "pweight") as! String) \n"
        
        showdata.text = displaystring
        counter = arr.count - 1
        displaystring = ""

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
