//
//  ViewController.swift
//  widgetsKullanim
//
//  Created by ÖMER  on 29.02.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelSonuc: UILabel!
    @IBOutlet weak var textFieldGirdi: UITextField!
    
    @IBOutlet weak var switchMy: UISwitch!
    
    @IBOutlet weak var segmentMy: UISegmentedControl!
    
    
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var sliderMy: UISlider!
    
    
    @IBOutlet weak var stepperLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        indicator.isHidden = true
    }

    @IBAction func buttonYap(_ sender: Any) {
        
        if let alinanVeri = textFieldGirdi.text{
            labelSonuc.text = alinanVeri
        }
    }
    
    
    @IBAction func gösterButton(_ sender: Any) {
        
        print("Switch Durum : \(switchMy.isOn)")
        
        let secilenIndex = segmentMy.selectedSegmentIndex
        let secilenKategori = segmentMy.titleForSegment(at: secilenIndex)
        print("Segment : \(secilenKategori!)")
        
        
        print(String(format: "Slider:  %.f", sliderMy.value))
        
        print(String(format: "Stepper : %.f", stepper.value))
        
    }
    
    @IBAction func switchControl(_ sender: UISwitch) {
        if sender.isOn{
            print("On")
        }else{
            print("Off")
        }
    }
    
    
    
    @IBAction func segmentButton(_ sender: UISegmentedControl) {
        
        let secilenIndex = sender.selectedSegmentIndex
        let secilenKategori = sender.titleForSegment(at: secilenIndex)
        
        print("Secim : \(secilenKategori!)")
        
    }
    
    
    
    
    @IBAction func sliderAction(_ sender: UISlider) {
        
    
        sliderLabel.text = String(format: "%.f", sender.value)
    }
    
    
    @IBAction func stepperButton(_ sender: UIStepper) {
        
        stepperLabel.text = String(Int(sender.value))
    }
    
    
    @IBAction func startButton(_ sender: Any) {
        indicator.isHidden = false
        indicator.startAnimating()
    }
    
    
    @IBAction func stopButton(_ sender: Any) {
        indicator.isHidden = true
        indicator.stopAnimating()
    }
    
}

