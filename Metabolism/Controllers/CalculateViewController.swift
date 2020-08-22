//
//  ViewController.swift
//  Metabolism
//
//  Created by Bilgihan Köse on 22.08.2020.
//  Copyright © 2020 Bilgihan Kose. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorBrain.getBMIValue()
    }
    
    @IBAction func calculateButton(_ sender: Any) {
        
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height, weight)
        self.performSegue(withIdentifier: "goToResult", sender: self) //birden fazla ekranla calistigimizda hangi ekrani acacagini gostermemiz icin id vermemiz gerekir.
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController //downcast etmezsek veriyi tasiyamayiz, cunku hangi VC oldugunu bilmiyor.
            destinationVC.bmiValue = calculatorBrain.getBMIValue() //burada artik ResultViewController'in property ve methodlarina ulasabiliyoruz, bu VC'den digerine veri tasiyabiliriz.
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
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


