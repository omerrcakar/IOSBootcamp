//
//  KisilerDaoRepository.swift
//  KisilerUygulamasi
//
//  Created by ÖMER  on 5.03.2024.
//

import Foundation
import RxSwift


class KisilerDaoRepository{
    
    
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
    
    func kaydet(kisi_ad:String, kisi_tel:String){
        print("Kisi Kaydet : \(kisi_ad) - \(kisi_tel)")
    }
    
    func guncelle(kisi_id:Int, kisi_ad:String, kisi_tel:String){
        print("Kisi Guncelle : \(kisi_id) - \(kisi_ad) - \(kisi_tel)")
    }
    
    
    func sil(kisi_id:Int){
        print("Kisi Sil: \(kisi_id)")
        KisileriYukle()
    }
    
    func ara(aramaSonucu:String){
        print("Kisi Ara: \(aramaSonucu)")
    }
    
    
    func KisileriYukle(){
        
        var liste = [Kisiler]()
        let k1 = Kisiler(kisi_id: 1, kisi_ad: "Ahmet", kisi_tel: "1111")
        let k2 = Kisiler(kisi_id: 2, kisi_ad: "Zeynep", kisi_tel: "2222")
        let k3 = Kisiler(kisi_id: 3, kisi_ad: "Ömer", kisi_tel: "3333")
        let k4 = Kisiler(kisi_id: 4, kisi_ad: "Safa", kisi_tel: "4444")
        
        liste.append(k1)
        liste.append(k2)
        liste.append(k3)
        liste.append(k4)
        
        kisilerListesi.onNext(liste)// tetikleme ve geri dönüş olayı başladı
        
    }
}
