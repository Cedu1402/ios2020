//
//  ViewController.swift
//  EditList
//
//  Created by cedric blaser on 05.10.20.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var plzLable: UILabel!
    public var selectedIndex: Int!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let person = DataProvider.sharedInstance.memberPersons[selectedIndex]
        nameLable.text = person.firstName
        plzLable.text = person.plz
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        (segue.destination as! EditViewController).selectedIndex = selectedIndex
    }
    
}

