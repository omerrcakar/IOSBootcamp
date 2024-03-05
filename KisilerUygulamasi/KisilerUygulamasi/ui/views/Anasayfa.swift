//
//  Anasayfa.swift
//  KisilerUygulamasi
//
//  Created by ÖMER  on 1.03.2024.
//

import UIKit

class Anasayfa: UIViewController {

    //UISearchBarDelegate protocolünü kullandırıyor bu da bize textdidchange fonksiyonu kullanmamızıı istiyor
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var kisilerTableView: UITableView!
    var kisilerListesi = [Kisiler]()
    
    var viewModel = AnasayfaViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // searchbarın delegate sini yukardaki protocole bağladık
        searchBar.delegate = self
        
        
        // table view ile yapıları arası bağlantı
        kisilerTableView.delegate = self
        kisilerTableView.dataSource = self
        
        _ = viewModel.kisilerListesi.subscribe(onNext: { liste in
            
            self.kisilerListesi = liste
            self.kisilerTableView.reloadData()
            
        })
        
        
    }
    

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay"{
            if let kisi = sender as? Kisiler{
                let gidilecekVC = segue.destination as! KisiDetay
                gidilecekVC.kisi = kisi
            }
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.KisileriYukle()
    }
    
}

extension Anasayfa: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.ara(aramaSonucu: searchText)
    }
    
}

extension Anasayfa:UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kisilerListesi.count
    }
    
    
    // bu döngü gibi tüm kisileri tek tek alıp sırayla gezer
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let kisi = kisilerListesi[indexPath.row]
        
        // hücreye erişim için tanımlamamzı gerek
        let hucre = tableView.dequeueReusableCell(withIdentifier: "kisilerHucre") as! KisilerHucre
        hucre.labelKisiAd.text = kisi.kisi_ad
        hucre.labelKisiTel.text = kisi.kisi_tel
        
        return hucre
    }
    
    // seçme işlemi
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let kisi = kisilerListesi[indexPath.row]
        
        performSegue(withIdentifier: "toDetay", sender: kisi)
        
        // seçili kalma kaldır
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){contextualAction,view,bool in
            // tıklanıldığında
            // hangi kişiyi seçtiğimizi bilmemiz lazım , ve self ile bu sayfadaki listeye eriş dedik
            let kisi = self.kisilerListesi[indexPath.row]
            
            // Alert kısmı
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(kisi.kisi_ad!) silinsin mi?", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){ action in
                self.viewModel.sil(kisi_id: kisi.kisi_id!)
                
            }
            
            alert.addAction(evetAction)
            self.present(alert, animated: true)
            
        }
        
        return UISwipeActionsConfiguration(actions: [silAction])
    }
    
}
