//
//  Secondcontroller.swift
//  Logincore
//
//  Created by Mohamed Musharaf on 18/04/22.
//

import UIKit
import CoreData
class Secondcontroller: UIViewController {
    
    @IBOutlet weak var UserName: UITextField!
    @IBOutlet weak var PassWord: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Login(_ sender: Any) {
        let app = UIApplication.shared.delegate as! AppDelegate
        
        let context = app.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        // request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "username = %@", "" + UserName.text!)
        
        let results:NSArray = try! context.fetch(request) as NSArray
        
        
        
        if(results.count != 0){
            let res = results[0] as! NSManagedObject
            if PassWord.text == res.value(forKey: "password") as? String {
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "fourthController") as! fourthController
                self.navigationController?.pushViewController(vc, animated: true)
                
            } else {
                let alert = UIAlertController(title:nil, message: "incorrect password", preferredStyle: UIAlertController.Style.alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                
                self.present(alert, animated: true, completion: nil)
                
            }
            
            
            
        }else{
            let alert = UIAlertController(title:nil, message: "Enter Correct username and password", preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
}
