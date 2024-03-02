//
//  FilmlerHucre.swift
//  FilmlerApp
//
//  Created by ÖMER  on 2.03.2024.
//

import UIKit

protocol HucreProtocol{
    func sepeteEkle(indexPath:IndexPath)
}


class FilmlerHucre: UICollectionViewCell {
    
    var hucreProtocol:HucreProtocol?
    var indexPath:IndexPath?
    
    
    @IBOutlet weak var imageViewFilm: UIImageView!
    @IBOutlet weak var labelFiyat: UILabel!
    
    @IBAction func buttonSepeteEkle(_ sender: Any) {
        
        hucreProtocol?.sepeteEkle(indexPath: indexPath!)
        
    }
    
}
