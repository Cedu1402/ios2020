//
//  EditViewController.swift
//  Persistency
//
//  Created by cedric blaser on 25.10.20.
//

import UIKit
import CoreData

class EditViewController: UIViewController, UITextFieldDelegate {

    var person: Person?
    var managedContext : NSManagedObjectContext?
    var detailView: DetailViewController?
    
    @IBOutlet weak var firstNameInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameInput.delegate = self
        firstNameInput.text = self.person?.name ?? ""
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        if let detailVC = self.detailView {
            detailVC.updateName()
        }
        
    }
    
    
    @IBAction func saveClicked(_ sender: Any) {
       /*  var person = DataProvider.sharedInstance.memberPersons[selectedIndex]
        person.firstName = firstNameInput.text ?? ""
        person.lastName = lastNameInput.text ?? ""
        person.plz = plzInput.text ?? ""
        DataProvider.sharedInstance.memberPersons[selectedIndex] = person
        self.delegate?.updatePerson() */
        guard let context = self.managedContext else {
            fatalError("Data context missing")
        }
        if ((self.person) != nil){
            self.person!.name = self.firstNameInput.text
        }else{
            self.person = Person(context: context)
            self.person!.name = self.firstNameInput.text
        }
        
        do{
            try context.save()
        } catch{
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }



}
