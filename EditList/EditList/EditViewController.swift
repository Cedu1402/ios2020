//
//  EditViewController.swift
//  EditList
//
//  Created by cedric blaser on 11.10.20.
//

import UIKit

class EditViewController: UIViewController, UITextFieldDelegate {
    
    public var selectedIndex: Int!
    @IBOutlet weak var firstNameInput: UITextField!
    @IBOutlet weak var plzInput: UITextField!
    @IBOutlet weak var lastNameInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameInput.delegate = self
        plzInput.delegate = self
        lastNameInput.delegate = self
        
        let person = DataProvider.sharedInstance.memberPersons[selectedIndex]
        firstNameInput.text = person.firstName
        lastNameInput.text = person.lastName
        plzInput.text = person.plz
    }
    
    @IBAction func saveClicked(_ sender: Any) {
        var person = DataProvider.sharedInstance.memberPersons[selectedIndex]
        person.firstName = firstNameInput.text ?? ""
        person.lastName = lastNameInput.text ?? ""
        person.plz = plzInput.text ?? ""
        DataProvider.sharedInstance.memberPersons[selectedIndex] = person
        navigationController?.popViewController(animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
