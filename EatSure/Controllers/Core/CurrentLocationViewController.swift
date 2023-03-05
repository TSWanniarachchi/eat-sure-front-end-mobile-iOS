//
//  CurrentLocationViewController.swift
//  EatSure
//
//  Created by Sachin on 2/17/23.
//

import UIKit
import CoreLocation

class CurrentLocationViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getCurrentLocation()
        
//        self.locationManager.delegate = self
//        self.locationManager.requestAlwaysAuthorization()
//        self.locationManager.startUpdatingLocation()
    }
    
    func getCurrentLocation(){
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                self.locationManager.delegate = self
                self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
                self.locationManager.startUpdatingLocation()
            }
        }
        
    }
    
    
    
}

extension CurrentLocationViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("goo")
        print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
}
