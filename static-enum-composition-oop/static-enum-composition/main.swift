//
//  main.swift
//  static-enum-composition
//
//  Created by ÖMER  on 25.02.2024.
//

import Foundation

// static değişken ve metotlar : sınıf ismi ile erişme imkanı

class Deneme {
    
    static var x = 10
    
    static func deneme1(){
        print("Deneme1")
    }
}


let d = Deneme()

print(Deneme.x)

Deneme.deneme1()


// Enum

enum KonserveBoyut{
    case kucuk
    case orta
    case buyuk
}


func ucretHesap(boyut:KonserveBoyut, adet:Int){
    
    switch boyut{
        case .buyuk: print("Fiyat : \(adet * 24) ₺")
        case .orta: print("Fiyat : \(adet * 14) ₺")
        case .kucuk: print("Fiyat : \(adet * 8) ₺")
    }
    
}


ucretHesap(boyut: .kucuk, adet: 5)





// Composition

class Kategoriler{
    var k_id:Int?
    var k_ad:String?
    
    init(k_id: Int, k_ad: String) {
        self.k_id = k_id
        self.k_ad = k_ad
    }
    
}



class Yonetmenler{
    var y_id:Int?
    var y_ad:String?
    
    init(y_id: Int, y_ad: String) {
        self.y_id = y_id
        self.y_ad = y_ad
    }
}



class Filmler{
    var f_id:Int?
    var f_ad:String?
    var f_yil:Int?
    var kategori:Kategoriler?
    var yonetmen:Yonetmenler?
    
    init(f_id: Int, f_ad: String, f_yil: Int, kategori: Kategoriler, yonetmen: Yonetmenler) {
        self.f_id = f_id
        self.f_ad = f_ad
        self.f_yil = f_yil
        self.kategori = kategori
        self.yonetmen = yonetmen
    }
    
}




let k1 = Kategoriler(k_id: 1, k_ad: "Dram")
let k2 = Kategoriler(k_id: 2, k_ad: "Komedi")

let y1 = Yonetmenler(y_id: 1, y_ad: "Ömer")
let y2 = Yonetmenler(y_id: 2, y_ad: "Mehmet")

let f1 = Filmler(f_id: 1, f_ad: "Work", f_yil: 2024, kategori: k1, yonetmen: y1)

print("Film id : \(f1.f_id!)")
print("Film ad : \(f1.f_ad!)")
print("Film yil : \(f1.f_yil!)")
print("Film kategori : \(f1.kategori!.k_ad!)")
print("Film yonetmen : \(f1.yonetmen!.y_ad!)")



// OOP

class Ev{
    var pencereSayisi:Int?
    
    init(pencereSayisi: Int) {
        self.pencereSayisi = pencereSayisi
    }
}

class Villa:Ev{
    var havuzluMu:Bool?
    
    init(havuzluMu: Bool, pencereSayisi: Int) {
        self.havuzluMu = havuzluMu
        super.init(pencereSayisi: pencereSayisi) // super ile bir üst sınıf olan kalıtılan (Ev ) deki init metoduna erişmiş olduk oradaki pencere sayısı değerine biz burdan değer gönderdik
    }
    
}

class Müstakil:Villa{
    
}


let e1 = Ev(pencereSayisi: 10)

let v1 = Villa(havuzluMu: true, pencereSayisi: 25)
let v2 = Villa(havuzluMu: false, pencereSayisi: 12)

print("Villa 1 : \(v1.havuzluMu!) - \(v1.pencereSayisi!)")
print("Villa 2 : \(v2.havuzluMu!) - \(v2.pencereSayisi!)")


// type casting

// upcasting

var ev = Villa(havuzluMu: true, pencereSayisi: 10) as Ev

// tip kontrol

if ev is Ev{
    print("Nesne ev sınıfındandır")
}

// downcasting

var villa = Ev(pencereSayisi: 12) as? Villa

if let villa = villa {
    // Downcasting başarılı oldu, villa değişkeni artık güvenli bir şekilde Villa tipine dönüştürülmüş oldu
    print("Villa sınıfına başarılı bir şekilde dönüştürüldü.")
} else {
    // Downcasting başarısız oldu, villa değişkeni nil olarak kaldı
    print("Downcasting başarısız oldu, villa değişkeni nil olarak kaldı.")
}

// downkasting deneme
var müstakil = Villa(havuzluMu: true, pencereSayisi: 34) as? Müstakil

if let müstakil = müstakil{
    // Downcasting başarılı oldu, müstakil değişkeni artık güvenli bir şekilde Müstakil tipine dönüştürülmüş oldu
    print("Müstakil sınıfına başarılı bir şekilde dönüştürüldü.")
}else {
    // Downcasting başarısız oldu, müstakil değişkeni nil olarak kaldı
    print("Downcasting başarısız oldu, villa değişkeni nil olarak kaldı.")
}


// başarılı downcasting

//class Ev {
//    var pencereSayisi: Int
//    
//    init(pencereSayisi: Int) {
//        self.pencereSayisi = pencereSayisi
//    }
//}
//
//class Villa: Ev {
//    var havuzluMu: Bool
//    
//    init(havuzluMu: Bool, pencereSayisi: Int) {
//        self.havuzluMu = havuzluMu
//        super.init(pencereSayisi: pencereSayisi)
//    }
//}
//
//// Ev sınıfından bir nesne oluşturuyoruz
//let ev = Ev(pencereSayisi: 8)
//
//// Güvenli downcasting yaparak Ev sınıfından oluşturduğumuz nesneyi Villa türüne dönüştürüyoruz
//if let villa = ev as? Villa {
//    // Downcasting başarılı oldu, villa değişkeni artık güvenli bir şekilde Villa tipine dönüştürülmüş oldu
//    print("Villa sınıfına başarılı bir şekilde dönüştürüldü.")
//    print("Villa'nın pencere sayısı: \(villa.pencereSayisi), Havuzlu mu: \(villa.havuzluMu)")
//} else {
//    // Downcasting başarısız oldu, villa değişkeni nil olarak kaldı
//    print("Downcasting başarısız oldu, villa değişkeni nil olarak kaldı.")
//}



// Protocol
// kendi özelliği varsa classına eklemeniz zorunlu , inheritanceden farkı 1
// bir class birden fazla protocol alabilir , inheritancedan farkı 2

protocol MyProtocol{
    var degisken:Int {get set} // set deger okuma, get deger atayabilme
    
    func metod1()
    
    func metod2() -> String
    
    func metod3(x:Int)
}


class ClassA: MyProtocol{
    var degisken: Int = 20
    
    func metod1() {
        print("Metod 1")
    }
    
    func metod2() -> String {
        return "Metod2"
    }
    
    func metod3(x: Int) {
        print("Yaşın \(x)")
    }
}


var a = ClassA()

print(a.degisken)

a.metod1()
a.metod3(x: 23)
print(a.metod2())


// Closure

let ifade = {
    print("Merhaba")
}

ifade()




// Closure kullanarak bir fonksiyon tanımlama
let toplam = { (sayilar: [Int]) -> Int in
    var toplam = 0
    for sayi in sayilar {
        toplam += sayi
    }
    return toplam
}



// Fonksiyonu kullanma
let sayiListesi = [1, 2, 3, 4, 5]
let sonuc = toplam(sayiListesi)
print("Dizideki sayıların toplamı: \(sonuc)")





// Closure kullanarak bir fonksiyon tanımlama
let kareleriAl = { (sayilar: [Int]) -> [Int] in
    var kareler = [Int]()
    for sayi in sayilar {
        let kare = sayi * sayi
        kareler.append(kare)
    }
    return kareler
}

// Fonksiyonu kullanma
let sayiListesi2 = [1, 2, 3, 4, 5]
let sonuc2 = kareleriAl(sayiListesi2)
print("Dizinin kareleri: \(sonuc2)")






// İleri seviye bir closure örneği
func herhangiSaglarMi(_ dizi: [Int], _ kontrol: (Int) -> Bool) -> Bool {
    for eleman in dizi {
        if kontrol(eleman) {
            return true
        }
    }
    return false
}

// Fonksiyonu kullanma
let sayiListesi3 = [1, 2, 3, 4, 5]

// Çift sayı kontrolü için bir closure tanımlama
let ciftKontrol = { (sayi: Int) -> Bool in
    return sayi % 2 == 0
}

// Dizide herhangi bir çift sayı var mı?
let sonuc3 = herhangiSaglarMi(sayiListesi3, ciftKontrol)
if sonuc3 {
    print("Dizide en az bir çift sayı var.")
} else {
    print("Dizide çift sayı bulunmuyor.")
}

//Yukarıdaki örnekte, herhangiSaglarMi isimli bir fonksiyon tanımlıyoruz. Bu fonksiyon, bir dizi ve bir koşul kontrol closure'ı alır.
// Dizideki herhangi bir elemanın koşulu sağlayıp sağlamadığını kontrol eder.
//
//ciftKontrol closure'ı, bir sayının çift olup olmadığını kontrol eder. Bu closure, herhangiSaglarMi fonksiyonuna bir koşul olarak iletilir.
//
//Bu örnek, closure'ların fonksiyonlara parametre olarak geçilebileceğini ve daha karmaşık kontrol yapılarına olanak tanıyabileceğini göstermektedir. 
//Bu tür kullanımlar, Swift dilinin işlevsel programlama yeteneklerinden yararlanarak kodunuzu daha esnek ve güçlü hale getirebilir.

