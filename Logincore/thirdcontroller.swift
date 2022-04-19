//
//  thirdcontroller.swift
//  Logincore
//
//  Created by Mohamed Musharaf on 18/04/22.
//

import UIKit
import CoreData

class thirdcontroller: UIViewController {
    
    @IBOutlet weak var Username: UITextField!
    
    @IBOutlet weak var Password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Signup(_ sender: Any) {
        
        let app = UIApplication.shared.delegate as! AppDelegate
        
        let context = app.persistentContainer.viewContext
        
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context) as NSManagedObject
        
        newUser.setValue(Username.text, forKey: "username")
        newUser.setValue(Password.text, forKey: "password")
        
        do {
            try context.save()
            print("data saved")
            print( " username : " ,Username.text!)
            print( " password : " ,Password.text!)
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "fourthController") as! fourthController
            self.navigationController?.pushViewController(vc, animated: true)
        } catch {
            print("DAta not saved")
            
        }
        
//        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
//
//        request.predicate = NSPredicate(format: "username = %@", "" + Username.text!)
//
//        let results:NSArray = try! context.fetch(request) as NSArray
//
//        if(results.count != 0){
//            let res = results[0] as! NSManagedObject
//            if Password.text == res.value(forKey: "password") as? String {
//               let password1 = res.value(forKey: "password") as? String
//               let Username1 = res.value(forKey: "username") as? String
//                print("\(String(describing: Username1!))")
//                print("\(String(describing: password1!))")
//            }
//
//
//
//        }
//
    }
    
}

