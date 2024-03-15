//
//  AnasayfaViewModel.swift
//  FilmlerApp
//
//  Created by ÖMER  on 5.03.2024.
//

import Foundation
import RxSwift

class AnasayfaViewModel{
    var filmlerListesi = BehaviorSubject<[Filmler]>(value: [Filmler]())
   
    var frepo = FilmlerDaoRepository()
    
    init(){
        filmlerListesi = frepo.filmlerListesi
        filmleriYukle()
    }
   
   func filmleriYukle(){
       frepo.filmleriYukle()
       
   }
    
    
}
