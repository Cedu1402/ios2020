//
//  ViewController.swift
//  SwiftProgrammers
//
//  Created by cedric blaser on 17.09.20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.addLable(name: "Swift 1234", posX: 40, posY: 10, color: UIColor.blue)
        let usePersonData = true
        
        var posY = 30
        if(usePersonData){
            for person in DataProvider.sharedInstance.memberPersons{
                posY = posY + 30
                addLable(person: person, pos: posY)
            }
        }else{
            for name in DataProvider.sharedInstance.memberNames{
                posY = posY + 30
                addLable(name: name, pos: posY)
            }
        }
    }
    
    private func addLable(name: String, pos: Int){
        switch pos {
        case 60:
            self.addLable(name: name, posX: 5, posY: pos, color: UIColor.red)
        case 90:
            self.addLable(name: name, posX: 5, posY: pos, color: UIColor.blue)
        default:
            self.addLable(name: name, posX: 5, posY: pos, color: UIColor.black)
        }
    }
    
    private func addLable(person: Person, pos: Int){
        self.addLable(name: person.firstName, posX: 0, posY: pos, color: UIColor.black)
        self.addLable(name: person.lastName, posX: 100, posY: pos, color: UIColor.blue)
        self.addLable(name: person.plz, posX: 200, posY: pos, color: UIColor.green)
    }

    private func addLable(name: String, posX: Int, posY: Int, color: UIColor){
        let lablePos = CGRect(x:posX, y:posY, width:100, height:100)
        let lable = UILabel(frame:lablePos)
        lable.text = name
        lable.textColor = color
        self.view.addSubview(lable)
    }
 
}

	
