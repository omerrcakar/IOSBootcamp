//
//  OyunEkraniVC.swift
//  sayfalarArasiVeriAktarim
//
//  Created by ÖMER  on 29.02.2024.
//

import UIKit

class OyunEkraniVC: UIViewController {

    
    var gelenKisi:Kisiler?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let k = gelenKisi{
            print("Ad : \(k.ad!)")
            print("Yas : \(k.yas!)")
            print("Boy : \(k.boy!)")
            print("Bekar : \(k.bekar!)")
        }
    }
    

    @IBAction func ilerleButton(_ sender: Any) {
        performSegue(withIdentifier: "goSonuc", sender: nil)
    }
    

    
    @IBAction func geriButton(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
