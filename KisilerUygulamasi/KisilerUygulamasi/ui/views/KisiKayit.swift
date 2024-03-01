//
//  KisiKayit.swift
//  KisilerUygulamasi
//
//  Created by ÖMER  on 1.03.2024.
//

import UIKit

class KisiKayit: UIViewController {

    
    
    @IBOutlet weak var tfKisiAd: UITextField!
    @IBOutlet weak var tfKisiTel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func buttonKaydet(_ sender: Any) {
        
        if let ka = tfKisiAd.text, let kt = tfKisiTel.text{
            kaydet(kisi_ad: ka, kisi_tel: kt)
        }
    }
    
    
    func kaydet(kisi_ad:String, kisi_tel:String){
        print("Kisi Kaydet : \(kisi_ad) - \(kisi_tel)")
    }

}
