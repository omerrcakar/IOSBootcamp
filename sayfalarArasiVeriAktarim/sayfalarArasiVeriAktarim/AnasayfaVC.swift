//
//  ViewController.swift
//  sayfalarArasiVeriAktarim
//
//  Created by ÖMER  on 29.02.2024.
//

import UIKit

class AnasayfaVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear çalıştı")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear çalıştı")
    }

    @IBAction func baslaButton(_ sender: Any) {
        var kisi = Kisiler(ad: "Ömer", yas: 23, boy: 1.76, bekar: true)
        performSegue(withIdentifier: "goGamePage", sender: kisi)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goGamePage"{
            if let veri = sender as? Kisiler{
                let gidilecekVC = segue.destination as! OyunEkraniVC
                gidilecekVC.gelenKisi = veri
            }
        }
    }
    
}

