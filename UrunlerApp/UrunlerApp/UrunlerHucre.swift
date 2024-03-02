//
//  UrunlerHucre.swift
//  UrunlerApp
//
//  Created by ÖMER  on 2.03.2024.
//

import UIKit

protocol HucreProtocol{
    func sepeteEkleTiklandi(indexPath:IndexPath)
}

class UrunlerHucre: UITableViewCell {

    var hucreProtocol:HucreProtocol?
    var indexPath:IndexPath?
    
    @IBOutlet weak var hucreArkaplan: UIView!
    @IBOutlet weak var imageViewUrun: UIImageView!
    @IBOutlet weak var labelUrunAd: UILabel!
    @IBOutlet weak var labelUrunFiyat: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func butonSepeteEkle(_ sender: Any) {
        
        // arayüzdeki herhangi bir görsele tıkamak için hucre içinde çalışmamız lazım!
        // 2 yapı arası iletişim oluşturmamız lazım
        // burdaki butona tıkladığımız zaman bunu anasayfa üzerinde çalıştırmak istiyoruz çünkü işlemleri anasayfa üzerinde yapıyoruz
        // hucre içinde hiçbir şeye erişemiyoruz
        // hucredeki butona tıkladığımız zaman anasayfada işlem yapsın istiyoruz
        // urunhucreden anasayafaya erişmek için Protocol kullanmamız lazım
        
        hucreProtocol?.sepeteEkleTiklandi(indexPath: indexPath!)
    }
    
    
    

}
