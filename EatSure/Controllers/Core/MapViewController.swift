//
//  ViewController.swift
//  EatSure
//
//  Created by Sachin on 2/15/23.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    let mapView : MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(mapView)
        
        setUpMap()
        setUpConstraints()
    }
    
    func setUpMap() {
        let latitude: CLLocationDegrees = 51.481663
        let longitude: CLLocationDegrees = -0.1931452
        
        let latDelta: CLLocationDegrees = 0.02
        let lonDelta: CLLocationDegrees = 0.02
        
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        
        let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let region = MKCoordinateRegion(center: coordinates, span: span)
        
        let annotation: MKPointAnnotation = MKPointAnnotation()
        annotation.coordinate = coordinates
        annotation.title = "You are here"
        annotation.subtitle = "Your coordinates are \n\(latitude)° N \n\(longitude)° W"
        
        mapView.setRegion(region, animated: true)
        mapView.addAnnotation(annotation)
    }
    
    func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }
    
}



/*
import UIKit
import MapKit

class ViewController: UIViewController {
    
    let loc = CLLocation(latitude: 36.7783, longitude: 119.4179)
    
    let mapView : MKMapView = {
        let map = MKMapView()
        map.overrideUserInterfaceStyle = .dark
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

       // view.backgroundColor = .yellow
        view.addSubview(mapView)
        setUpConstraints()
    }
    
    //  MARK: - UI Setup Constraints
    private func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: self.view.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        
        ])
        
    }
    
}


extension ViewController : MKMapViewDelegate {
    
}
*/
