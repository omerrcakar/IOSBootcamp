//
//  MatRepository.swift
//  MVVMKullanimi
//
//  Created by ÖMER  on 3.03.2024.
//

import Foundation
import RxSwift

class MatRepository{
    
    var sonuc = BehaviorSubject<String>(value: "0")
    
    // sonuc'a değer aktarıldığı anda bu nerede observe(gözlem) gözlemleniyorsa  orası anlık olarak çalışıcak
    
    func toplamaYap(tf1:String, tf2:String){
        if let num1 = Int(tf1), let num2 = Int(tf2){
            sonuc.onNext("\(num1 + num2)") // Tetikleme
        }else{
            sonuc.onNext("Hatalı giriş karakteri") // Tetikleme
        }
    }
    
    
    func carpmaYap(tf1:String, tf2:String){
        if let num1 = Int(tf1), let num2 = Int(tf2){
            sonuc.onNext("\(num1 * num2)") // Tetikleme
        }else{
            sonuc.onNext("Hatalı giriş karakteri") // Tetikleme
        }
    }
    
}
