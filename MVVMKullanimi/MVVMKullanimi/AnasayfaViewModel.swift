//
//  AnasayfaViewModel.swift
//  MVVMKullanimi
//
//  Created by ÖMER  on 3.03.2024.
//

import Foundation
import RxSwift

class AnasayfaViewModel{
    
    var sonuc = BehaviorSubject<String>(value: "0")
    
    var matRepo = MatRepository()
    
    init(){
        sonuc = matRepo.sonuc
    }
    
    
    
    func toplamaYap(tf1:String, tf2:String){
        matRepo.toplamaYap(tf1: tf1, tf2: tf2)
    }
    
    
    func carpmaYap(tf1:String, tf2:String){
        matRepo.carpmaYap(tf1: tf1, tf2: tf2)
    }
    
    
}
