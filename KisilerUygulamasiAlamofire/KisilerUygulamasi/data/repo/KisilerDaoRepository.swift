//
//  KisilerDaoRepository.swift
//  KisilerUygulamasi
//
//  Created by ÖMER  on 5.03.2024.
//

import Foundation
import RxSwift
import Alamofire


class KisilerDaoRepository{
    
    
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
    
    func kaydet(kisi_ad:String, kisi_tel:String){
        // gönderilecek Parametreler
        let params:Parameters = ["kisi_ad":kisi_ad, "kisi_tel":kisi_tel]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/insert_kisiler.php",method: .post, parameters: params).response{ response in
            
            if let data = response.data{
                do{
                    let cevap = try JSONDecoder().decode(CRUDCevap.self, from: data)
                    print("Başarı: \(cevap.success!)")
                    print("Mesaj: \(cevap.message!)")
                    
                }catch{
                    print(error.localizedDescription)
                }
            }
            
        }
    }
    
    func guncelle(kisi_id:Int, kisi_ad:String, kisi_tel:String){
        // gönderilecek Parametreler
        let params:Parameters = ["kisi_id":kisi_id,"kisi_ad":kisi_ad, "kisi_tel":kisi_tel]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/update_kisiler.php",method: .post, parameters: params).response{ response in
            
            if let data = response.data{
                do{
                    let cevap = try JSONDecoder().decode(CRUDCevap.self, from: data)
                    print("Başarı: \(cevap.success!)")
                    print("Mesaj: \(cevap.message!)")
                    
                }catch{
                    print(error.localizedDescription)
                }
            }
            
        }
    }
    
    
    func sil(kisi_id:Int){
        // gönderilecek Parametreler
        let params:Parameters = ["kisi_id":kisi_id]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/delete_kisiler.php",method: .post, parameters: params).response{ response in
            
            if let data = response.data{
                do{
                    let cevap = try JSONDecoder().decode(CRUDCevap.self, from: data)
                    print("Başarı: \(cevap.success!)")
                    print("Mesaj: \(cevap.message!)")
                    self.KisileriYukle()
                    
                }catch{
                    print(error.localizedDescription)
                }
            }
            
        }
        
    }
    
    func ara(aramaSonucu:String){
        // gönderilecek Parametreler
        let params:Parameters = ["kisi_ad":aramaSonucu]
        
    
        AF.request("http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php",method: .post,parameters: params).response{ response in
            
            if let data = response.data{
                do{
                    let cevap = try JSONDecoder().decode(KisilerCevap.self, from: data)
                    if let liste = cevap.kisiler{
                        self.kisilerListesi.onNext(liste)// tetikleme ve geri dönüş olayı başladı
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
            
        }
    }
    
    
    func KisileriYukle(){
        
        AF.request("http://kasimadalan.pe.hu/kisiler/tum_kisiler.php",method: .get).response{ response in
            
            if let data = response.data{
                do{
                    let cevap = try JSONDecoder().decode(KisilerCevap.self, from: data)
                    if let liste = cevap.kisiler{
                        self.kisilerListesi.onNext(liste)// tetikleme ve geri dönüş olayı başladı
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
            
        }
        
    }
}
