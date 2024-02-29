//
//  ViewController.swift
//  alertKullanim
//
//  Created by ÖMER  on 29.02.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func butonAlert(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Başlık", message: "Mesaj", preferredStyle: .alert)
        
        let iptalAction = UIAlertAction(title: "İptal", style: .cancel) { action in
            print("İptal Button")
        }
        
        let tamamAction = UIAlertAction(title: "Tamam", style: .destructive) { action in
            print("Tamam Button")
        }
        
        alertController.addAction(iptalAction)
        alertController.addAction(tamamAction)
        
        self.present(alertController, animated: true)
        
        
        
    }
    
    @IBAction func butonActionSheet(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Başlık", message: "Mesaj", preferredStyle: .actionSheet)
        
        let iptalAction = UIAlertAction(title: "İptal", style: .cancel) { action in
            print("İptal Button")
        }
        
        let tamamAction = UIAlertAction(title: "Tamam", style: .destructive) { action in
            print("Tamam Button")
        }
        
        alertController.addAction(iptalAction)
        alertController.addAction(tamamAction)
        
        self.present(alertController, animated: true)
        
    }
    
    @IBAction func butonCustomAlert(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Başlık", message: "Mesaj", preferredStyle: .alert)
        
        alertController.addTextField{ textField in
            
            textField.placeholder = "Veri gir"
            textField.keyboardType = .numberPad
            textField.isSecureTextEntry = true
            
        }
        
        alertController.addTextField()
        
        let tamamAction = UIAlertAction(title: "Kaydet", style: .cancel) { action in
            // Kaydet butonuna basınca yazılan textfield dan veri alma
            let tf = alertController.textFields![0] as UITextField
            let tf1 = alertController.textFields![1] as UITextField
           
            if let alinanVeri = tf.text, let alinanVeri1 = tf.text{
                print("Alinan Veri : \(alinanVeri) - \(alinanVeri1)")
            }
        }
        
        
        alertController.addAction(tamamAction)
        
        self.present(alertController, animated: true)
        
    }
    
    
}

