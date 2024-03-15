//
//  ViewController.swift
//  notificationWork
//
//  Created by ÖMER  on 15.03.2024.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    var izinKontrol = false
    
    var bildirim = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // arka planda çalışması için delegate baglama
        UNUserNotificationCenter.current().delegate = self
        
        // uygulamaya daha önce bildirim için izin verilmedi ise bize alert göstericek , izin verirsek granted true olucak
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge]) { granted, error in
            self.izinKontrol = granted
            
            if granted{
                print("İzin alma işlemi başarılı")
            }else{
                print("İzin alma işlemi başarısız")
            }
        }
    }

    // bildirim arka planda çalışması
    @IBAction func buttonNatification(_ sender: Any) {
        if izinKontrol{
            bildirim += 1
            let icerik = UNMutableNotificationContent()
            icerik.title = "Başlık"
            icerik.subtitle = "Alt Baslık"
            icerik.body = "Mesaj"
            icerik.badge = Int(bildirim) as NSNumber
            icerik.sound = UNNotificationSound.default
            
            let tetikleme = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            
            let bildirimIstek = UNNotificationRequest(identifier: "id", content: icerik, trigger: tetikleme)
            UNUserNotificationCenter.current().add(bildirimIstek)
        }
    }
    
}
// bildrim arkaplanda çalışma için
extension ViewController: UNUserNotificationCenterDelegate{
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner,.sound,.badge])
    }
    
    // bildrime tıklama kısmı ve bilfdirim sayısı azaltma
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        // uygulamaya erişme
        let app = UIApplication.shared
        
        bildirim -= 1
        UNUserNotificationCenter.current().setBadgeCount(bildirim)
        
        if app.applicationState == .active{
            print("Ön planda: Bildirim seçildi")
        }
        
        if app.applicationState == .inactive{
            print("Arka planda: Bildirim seçildi")
        }
        
        
        completionHandler()
    }
}
