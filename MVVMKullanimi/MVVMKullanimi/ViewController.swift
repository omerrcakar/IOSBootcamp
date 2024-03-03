//
//  ViewController.swift
//  MVVMKullanimi
//
//  Created by ÖMER  on 3.03.2024.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var sonucLabel: UILabel!
    
    @IBOutlet weak var tfNum1: UITextField!
    @IBOutlet weak var tfNum2: UITextField!
    
    
    var viewModel = AnasayfaViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        sonucLabel.text = viewModel.sonuc
        
        _ = viewModel.sonuc.subscribe(onNext: { s in  // Dinleme , viemodeldeki yapıda sonuc a değer atandığı anda ordan tetiklenip buraya geliyor ve burda her değiştiğinde okunuyor
            self.sonucLabel.text = s
            
        })
    }

    
    @IBAction func buttonTopla(_ sender: Any) {
        
        if let tf1 = tfNum1.text , let tf2 = tfNum2.text{
            viewModel.toplamaYap(tf1: tf1, tf2: tf2)
//            sonucLabel.text = viewModel.sonuc
        }
    }
    
    @IBAction func buttonCarp(_ sender: Any) {
        if let tf1 = tfNum1.text , let tf2 = tfNum2.text{
            viewModel.carpmaYap(tf1: tf1, tf2: tf2)
//            sonucLabel.text = viewModel.sonuc
        }
    }
    
}

