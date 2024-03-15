//
//  ViewController.swift
//  LokasyonIslemleri
//
//  Created by ÖMER  on 16.03.2024.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var labelEnlem: UILabel!
    @IBOutlet weak var labelBoylam: UILabel!
    @IBOutlet weak var labelHiz: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // izin aktifleme
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()// konumu sürekli güncelleyerek verme
        
        locationManager.delegate = self
        
        
        // 41.0370013,28.974792
//        let konum = CLLocationCoordinate2D(latitude: 41.0370013, longitude: 28.974792)
//        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
//        let region = MKCoordinateRegion(center: konum, span: span)
//        mapView.setRegion(region, animated: true)
//        
//        let pin = MKPointAnnotation()
//        pin.coordinate = konum
//        pin.title = "Taksim"
//        pin.subtitle = "Taksim Meydani"
//        
//        mapView.addAnnotation(pin)
    }


}

extension ViewController: CLLocationManagerDelegate{
    // enlem boylam hızda değişiklik oldugu anda sğürekli değer vericek
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let sonKonum = locations[locations.count - 1]
        
        let enlem = sonKonum.coordinate.latitude
        
        let boylam = sonKonum.coordinate.longitude
        labelEnlem.text = "Enlem : \(enlem)"
        labelBoylam.text = "Boylam : \(boylam)"
        labelHiz.text = "Hız : \(sonKonum.speed)"
        
        
        let konum = CLLocationCoordinate2D(latitude: enlem, longitude: boylam)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: konum, span: span)
        mapView.setRegion(region, animated: true)
        
//        let pin = MKPointAnnotation()
//        pin.coordinate = konum
//        pin.title = "\(enlem) - \(boylam)"
//        pin.subtitle = "Konum"
//        
//        mapView.addAnnotation(pin)
        mapView.showsUserLocation = true

    }
}
