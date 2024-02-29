//
//  Kisiler.swift
//  sayfalarArasiVeriAktarim
//
//  Created by ÖMER  on 29.02.2024.
//

import Foundation

class Kisiler{
    var ad:String?
    var yas:Int?
    var boy:Double?
    var bekar:Bool?
    
    init(){
        
    }
    
    init(ad: String, yas: Int, boy: Double, bekar: Bool) {
        self.ad = ad
        self.yas = yas
        self.boy = boy
        self.bekar = bekar
    }
}
