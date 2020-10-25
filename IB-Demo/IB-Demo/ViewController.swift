//
//  ViewController.swift
//  IB-Demo
//
//  Created by cedric blaser on 22.09.20.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var sliderValue: UILabel!
    
    @IBOutlet weak var sliderElement: UISlider!
    
    @IBOutlet weak var spinnerElement:
        UIActivityIndicatorView!

    private var lastSliderValue: Float = 33
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sliderElement.setValue(lastSliderValue, animated: true)
        sliderValue.text = String(format: "%.2f", lastSliderValue)
        // Do any additional setup after loading the view.
    }

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        if(self.lastSliderValue < 70 && sender.value < 70 ){
            showAlertMessage()
        }
        sliderValue.text = String(format: "%.2f", sender.value)
        self.lastSliderValue = sender.value
        
    }
    
    private func showAlertMessage(){
        let alert = UIAlertController(title: "ALERT!!!!", message: "This is an alert. High slider values are dangerous.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func colorButtonValueChanged(_ sender: UISegmentedControl) {
        if(sender.selectedSegmentIndex == 0){
            self.view.backgroundColor = UIColor.green
        }else{
            self.view.backgroundColor = UIColor.blue
        }
    }
    
    @IBAction func spinButtonPressed(_ sender: UIButton) {
        if(spinnerElement.isAnimating){
            sender.setTitle("Start spining", for: .normal)
            spinnerElement.stopAnimating()
        }else{
            sender.setTitle("STOP SPINING", for: .normal)
            spinnerElement.startAnimating()
        }
    }
    
    @IBAction func infoButtonPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Info pressed", message: "This is an alert.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        alert.addAction(UIAlertAction(title: "..really", style: .cancel, handler: nil))

        self.present(alert, animated: true, completion: nil)
        
    }
}

