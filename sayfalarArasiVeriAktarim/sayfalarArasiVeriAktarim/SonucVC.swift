//
//  SonucVC.swift
//  sayfalarArasiVeriAktarim
//
//  Created by ÖMER  on 29.02.2024.
//

import UIKit

class SonucVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func geriButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
   
    @IBAction func bitirButton(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
