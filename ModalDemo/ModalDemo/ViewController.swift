//
//  ViewController.swift
//  ModalDemo
//
//  Created by cedric blaser on 04.10.20.
//

import UIKit

class ViewController: UIViewController {
    
    private let secondViewController = SecondViewController()
    private var appearanceCounter = 0

    @IBOutlet weak var counterLable: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        appearanceCounter += 1
        self.counterLable?.text = String(self.appearanceCounter)
    }

    @IBAction func showSecondView(_ sender: UIButton) {
        self.secondViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        
        // self.secondViewController.modalTransitionStyle = UIModalTransitionStyle.partialCurl
    
        self.secondViewController.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        
        // self.present(self.secondViewController, animated: true, completion: nil)
        self.show(self.secondViewController, sender: self)
    }
    
    
    @IBAction func backAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func unwindAction(unwindSeque: UIStoryboardSegue){
        appearanceCounter += 1
        self.counterLable?.text = String(self.appearanceCounter)
    }
    
}

