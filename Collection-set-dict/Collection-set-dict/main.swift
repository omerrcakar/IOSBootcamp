//
//  main.swift
//  Collection-set-dict
//
//  Created by ÖMER  on 27.02.2024.
//

import Foundation

// set : içerisi karışık indexli ve her eleman 1 tane olur



var sayilar = [Int]()

sayilar.append(1)
sayilar.append(2)
sayilar.append(3)
sayilar.append(4)
sayilar.append(5)


for (i,sayi) in sayilar.enumerated(){
    
    print("\(i).indexteki sayi : \(sayi)")
    
}



// oop with array

class Ogrenciler{
    var no:Int?
    var ad:String?
    var sinif:String?
    
    init(no: Int, ad: String, sinif: String) {
        self.no = no
        self.ad = ad
        self.sinif = sinif
    }
    
    
}


var ogrenciListesi = [Ogrenciler]()

var o1 = Ogrenciler(no: 200, ad: "Ömer", sinif: "11C")
var o2 = Ogrenciler(no: 250, ad: "Safa", sinif: "12C")
var o3 = Ogrenciler(no: 300, ad: "Kaan", sinif: "9C")

ogrenciListesi.append(o1)
ogrenciListesi.append(o2)
ogrenciListesi.append(o3)



// Filtreleme
// $0 demek her bir Ogrenciler sınıfından oluşmuş ogrenciListesiden bir nesneyi temsil eder yani o1,o2,o2 her biri içinde gezer ve no ya göre
// filtreler
var f1 = ogrenciListesi.filter({ $0.no! > 220 && $0.no! < 270 })

for o in f1{
    print("No: \(o.no!), Ad: \(o.ad!), Sinif: \(o.sinif!)")
}


var f2 = ogrenciListesi.filter({ $0.ad!.contains("a") })

for o in f2{
    print("No: \(o.no!), Ad: \(o.ad!), Sinif: \(o.sinif!)")
}



// Sıralama
print("Siralama")
var s1 = ogrenciListesi.sorted(by: { $0.no! > $1.no! })

for o in s1{
    print("No: \(o.no!), Ad: \(o.ad!), Sinif: \(o.sinif!)")
}

var s2 = ogrenciListesi.sorted(by: { $0.ad! > $1.ad! })

for o in s2{
    print("No: \(o.no!), Ad: \(o.ad!), Sinif: \(o.sinif!)")
}



// Set

var meyveler = Set<String>()

meyveler.insert("Elma")
meyveler.insert("Armut")
meyveler.insert("Muz")


// Dict

var iller = [Int:String]()

iller[16] = "Bursa"
iller[34] = "İstanbul"
iller[41] = "Kocaeli"




// guard , if in tam tersi , false ise çalışır

func kisiTanima(ad:String){
    guard ad == "Ömer" else{
        print("Tanınmadı")
        return
    }
    
    print("Tanındı")
}
kisiTanima(ad: "Ömer")



// Hata ayıklama
// 1. Compile error = Editör hatası

// 2 Runtime error = Exception : Çalışma sırasında oluşanhatalar

enum Hatalar:Error{
    case sifiraBolunmeHatasi
}

// bu fonksiyonu kullanırken burda hata olabilir ve burda try catch kullan demeliyiz -> throws ekleriz yani
// throws: hata oluştuma ihimali olan bir fonksiyon demektir
func bolme(s1:Int,s2:Int) throws -> Int{
    if s2 == 0{
        throw Hatalar.sifiraBolunmeHatasi
    }
    return s1 / s2
}


do{
    let sonuc = try bolme(s1: 10, s2: 0)
    print(sonuc)
}catch Hatalar.sifiraBolunmeHatasi {
    print("Sifira Bölünme Hatasi")
}


// 2. yolu

let sonuc1 = try? bolme(s1: 10, s2: 0)  // hata varsa nil döner yoksa normal sonuc cıkar

if let temp = sonuc1{
    print(sonuc1)
}else{
    print("Sifira Bölünme Hatasi")
}
