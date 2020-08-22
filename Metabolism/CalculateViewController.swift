//
//  ViewController.swift
//  Metabolism
//
//  Created by Bilgihan Köse on 22.08.2020.
//  Copyright © 2020 Bilgihan Kose. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateButton(_ sender: Any) {
        print(heightSlider.value)
        let height = heightSlider.value
        let weight = weightSlider.value
        let bmi = weight / (height * height)
        print(bmi)
        
    }
    
    @IBAction func heightSliderValue(_ sender: UISlider) {
        let heightSliderValue = String(format: "%.2f", sender.value)
        heightLabel.text = "\(heightSliderValue) M"
    }
    @IBAction func weightSliderValue(_ sender: UISlider) {
        let weightSliderValue = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weightSliderValue) Kg"
    }
}


