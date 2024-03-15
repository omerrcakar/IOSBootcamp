//
//  KisilerDaoRepository.swift
//  KisilerUygulamasi
//
//  Created by ÖMER  on 5.03.2024.
//

import Foundation
import RxSwift
import FirebaseFirestore

class KisilerDaoRepository{
    
    
    
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
    var collectionKisiler = Firestore.firestore().collection("Kisiler")
    
    func kaydet(kisi_ad:String, kisi_tel:String){
        let yeniKisi:[String:Any] = ["kisi_id": "","kisi_ad":kisi_ad, "kisi_tel":kisi_tel]
        collectionKisiler.document().setData(yeniKisi)
    }
    
    func guncelle(kisi_id:String, kisi_ad:String, kisi_tel:String){
        let guncellenenKisi:[String:Any] = ["kisi_ad":kisi_ad, "kisi_tel":kisi_tel]
        collectionKisiler.document(kisi_id).updateData(guncellenenKisi)
    }
    
    
    func sil(kisi_id:String){
        collectionKisiler.document(kisi_id).delete()
        
    }
    
    func ara(aramaSonucu:String){
        // otomatik olarak degişiklikleri ( silme güncellme ekleme ) gibi işlemleri anlıyor bu
        collectionKisiler.addSnapshotListener{ snapshot, error in
            
            var liste = [Kisiler]()
            
            // tüm dokumanlara erişmek
            if let documents = snapshot?.documents{
                // her dökümanda gezmek
                for document in documents{
                    // documan içindeki her bir veriye erişme ismi teli id si gibi doc id hariç
                    let data = document.data()
                    
                    let kisi_id = document.documentID
                    
                    let kisi_ad = data["kisi_ad"] as? String ?? ""
                    let kisi_tel = data["kisi_tel"] as? String ?? ""
                    
                    if kisi_ad.lowercased().contains(aramaSonucu.lowercased()){
                        // kişi nesnesi oluşturma
                        let kisi = Kisiler(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
                        liste.append(kisi)
                    }
                    
                }
            }
            
            self.kisilerListesi.onNext(liste)// tetikleme ve geri dönüş olayı başladı
            
        }
    }
    
    
    func KisileriYukle(){
        // otomatik olarak degişiklikleri ( silme güncellme ekleme ) gibi işlemleri anlıyor bu
        collectionKisiler.addSnapshotListener{ snapshot, error in
            
            var liste = [Kisiler]()
            
            // tüm dokumanlara erişmek
            if let documents = snapshot?.documents{
                // her dökümanda gezmek
                for document in documents{
                    // documan içindeki her bir veriye erişme ismi teli id si gibi doc id hariç
                    let data = document.data()
                    
                    let kisi_id = document.documentID
                    
                    let kisi_ad = data["kisi_ad"] as? String ?? ""
                    let kisi_tel = data["kisi_tel"] as? String ?? ""
                    
                    // kişi nesnesi oluşturma
                    let kisi = Kisiler(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
                    liste.append(kisi)
                    
                }
            }
            
            self.kisilerListesi.onNext(liste)// tetikleme ve geri dönüş olayı başladı
            
        }
        
    }
    
}
