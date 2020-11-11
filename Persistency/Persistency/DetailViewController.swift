//
//  DetailViewController.swift
//  Persistency
//
//  Created by cedric blaser on 25.10.20.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {
    let numberKey = "NumberOfVisits"
    var person: Person?
    var managedContext : NSManagedObjectContext?
    
    
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var numberOfVisits: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public func updateName(){
        self.firstName.text = self.person!.name
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let newCounter = UserDefaults.standard.integer(forKey: numberKey) + 1
        UserDefaults.standard.setValue(newCounter, forKey: numberKey)
        self.numberOfVisits.text = String(newCounter)
        
        firstName.isUserInteractionEnabled = false
        firstName.text = person?.name ?? ""
        
    }


    @IBAction func showEditView(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let editView = storyboard.instantiateViewController(withIdentifier: "editView") as! EditViewController
        
        editView.managedContext = self.managedContext
        editView.person = self.person
        editView.detailView = self

        self.present(editView, animated: true, completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = (segue.destination as! EditViewController)
        vc.managedContext = self.managedContext
        vc.person = self.person 
    }
    

}
