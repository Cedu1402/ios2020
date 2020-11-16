//
//  ViewController.swift
//  ComAndCon
//
//  Created by cedric blaser on 13.11.20.
//

import UIKit
import Vision

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var imagePicker: UIPickerView!
    var pickerData: [ImageInfo] = []
    @IBOutlet weak var imageTitle: UILabel!
    @IBOutlet weak var imageBox: UIImageView!
    
    @IBOutlet weak var classificationText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imagePicker.delegate = self
        self.imagePicker.dataSource = self
        
        self.pickerData = loadListSync() ?? []
        self.updateScreenTextAndImage(row: 0)
    }
    
    
    func loadListSync() -> [ImageInfo]? {
        let data = try? Data(contentsOf: URL(string: "https://hslu.nitschi.ch/networking/data.json")!)
        if(data == nil){
            return nil
        }
        
        do{
            let response = try JSONDecoder().decode(Response.self, from: data!)
            return response.images
        }catch {
            print("Unexpected error: \(error).")
            return nil
        }
    }
    
    func updateScreenTextAndImage(row: Int){
        self.imageTitle.text = self.pickerData[row].title
        self.loadImageAsync(image: self.pickerData[row]) { (image: UIImage?) in
            self.imageBox.image = image
            self.classifyImageAsync(image: image) { (text: String?) in
                self.classificationText.text = text
            }
        }
    }
    
    func loadImageSync(image: ImageInfo) -> UIImage? {
       let image = try? UIImage(data: Data(contentsOf: image.url))
       return image
    }
    
    func loadImageAsync(image: ImageInfo, completion: @escaping(UIImage?)->Void) {
        DispatchQueue.main.async{
            let image = self.loadImageSync(image: image)
            completion(image)
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pickerData.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return self.pickerData[row].text
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.updateScreenTextAndImage(row: row)
        
    }

    
    func classifyImageAsync(image: UIImage?, completion: @escaping (String?) -> Void) {
    DispatchQueue.global().async {
        guard let cgImage = image?.cgImage else {
                DispatchQueue.main.async {
                        completion(nil)
                }
            return
        }
    // create a image request handler
    let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
    // perform a classify-request
    try? handler.perform([VNClassifyImageRequest(
                            completionHandler: { (request, error) in
                            // Use the full power of swift: If there are results (0), take only the classifications and filter everything else (1), then filter for a confidence greater 0.8 (2), extract the identifier strings (3) and join them to a comma- separated list (4)
                                let topResults = request.results? // 0
                                    .compactMap { $0 as?
                                        VNClassificationObservation } // 1
                                    .filter { $0.confidence > 0.8 } // 2
                                    .map { $0.identifier } // 3
                                    .joined(separator: ", ") // 4
                                DispatchQueue.main.async {
                                    completion(topResults)
                                }
                            }
        )])
        
    }
    }
}

