//
//  ViewController.swift
//  date-timepicker-kullanimi
//
//  Created by ÖMER  on 2.03.2024.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tfSaat: UITextField!
    @IBOutlet weak var tfTarih: UITextField!
    
    var datePicker:UIDatePicker?
    var timePicker:UIDatePicker?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        tfTarih.inputView = datePicker
        
        timePicker = UIDatePicker()
        timePicker?.datePickerMode = .time
        tfSaat.inputView = timePicker
        
        
        if #available(iOS 13.4, *){
            datePicker?.preferredDatePickerStyle = .wheels
            timePicker?.preferredDatePickerStyle = .wheels
        }
        
        let dokunmaAlgilama = UITapGestureRecognizer(target: self, action: #selector(dokunmaAlgilamaMetod))
        view.addGestureRecognizer(dokunmaAlgilama)
        
        datePicker?.addTarget(self, action: #selector(tarihGöster(uiDatePicker:)), for: .valueChanged)
        timePicker?.addTarget(self, action: #selector(saatGöster(uiDatePicker:)), for: .valueChanged)
        
    }

    @objc func dokunmaAlgilamaMetod(){
        print("Ekrana dokunuldu")
        view.endEditing(true)
    }
    
    @objc func tarihGöster(uiDatePicker:UIDatePicker){
        let format = DateFormatter()
        format.dateFormat = "dd/MM/yyyy"
        let alinanTarih = format.string(from: uiDatePicker.date)
        tfTarih.text = alinanTarih
        
    }
    
    @objc func saatGöster(uiDatePicker:UIDatePicker){
        let format = DateFormatter()
        format.dateFormat = "HH:mm"
        let alinanSaat = format.string(from: uiDatePicker.date)
        tfSaat.text = alinanSaat
        
    }

}

