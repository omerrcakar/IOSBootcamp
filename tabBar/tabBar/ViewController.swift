//
//  ViewController.swift
//  tabBar
//
//  Created by ÖMER  on 29.02.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tab bar itemlara badge defer atama
        if let tabItems = tabBarController?.tabBar.items{
            let anasayfaItem = tabItems[0]
            let ayarlarItem = tabItems[1]
            
            anasayfaItem.badgeValue = "3"
            ayarlarItem.badgeValue = "Yeni"
        }
        
        
        // tab bar renk ayarlama
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = UIColor.systemIndigo
        
        renkDegis(itemAppearance: appearance.inlineLayoutAppearance)
        renkDegis(itemAppearance: appearance.stackedLayoutAppearance)
        renkDegis(itemAppearance: appearance.compactInlineLayoutAppearance)
        
        tabBarController?.tabBar.standardAppearance = appearance
        tabBarController?.tabBar.scrollEdgeAppearance = appearance
    }
    
    func renkDegis(itemAppearance: UITabBarItemAppearance){
        // seçili
        itemAppearance.selected.iconColor = UIColor.systemOrange
        itemAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.systemOrange]
        itemAppearance.selected.badgeBackgroundColor = UIColor.systemMint
        // seçili olmayan
        itemAppearance.normal.iconColor = UIColor.white
        itemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]
        itemAppearance.normal.badgeBackgroundColor = UIColor.lightGray
    }


}

