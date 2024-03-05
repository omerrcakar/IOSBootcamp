//
//  AnasayfaViewModel.swift
//  KisilerUygulamasi
//
//  Created by ÖMER  on 5.03.2024.
//

import Foundation
import RxSwift

class AnasayfaViewModel{
    

    var krepo = KisilerDaoRepository()
    
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
    
    init(){
        kisilerListesi = krepo.kisilerListesi // repo ile burdaki rxswft yapısı bağlandı uyg. ilk açıldığında viewmodel nesnesi oluştrulunca
        
        KisileriYukle() // bu çalışınca repodaki yer tetiklenicek ve veriyi geri döndürüp anasyafada gösterme yolunda decam eder
    }
    
    
    func sil(kisi_id:Int){
        krepo.sil(kisi_id: kisi_id)
    }
    
    func ara(aramaSonucu:String){
        krepo.ara(aramaSonucu: aramaSonucu)
    }
    
    
    func KisileriYukle(){
        krepo.KisileriYukle()
    }
}
