//
//  FourthViewController.swift
//  WeightLiftApp
//
//  Created by Dylan Stukin on 5/4/22.
//

import UIKit
import MapKit
import CoreLocation

class FourthViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet var mapView: MKMapView!
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation!
    
    var Gyms: [MKMapItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        mapView.showsUserLocation = true
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()

    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentLocation = locations[0]
    }
    
    @IBAction func whenZoomButtonPressed(_ sender: Any) {
        let myCenter = currentLocation.coordinate
        let mySpan = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let myRegion = MKCoordinateRegion(center: myCenter, span: mySpan)
        mapView.setRegion(myRegion, animated: true)
        
    }
    
    @IBAction func whenSearchButtonpressed(_ sender: Any) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = "Gyms"
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        request.region = MKCoordinateRegion(center: currentLocation.coordinate, span: span)
        let search = MKLocalSearch(request: request)
        
        search.start { myResponse, myError in
            guard let response = myResponse else { return }
            for currentMapItem in response.mapItems {
                self.Gyms.append(currentMapItem)
                let annotation = MKPointAnnotation()
                annotation.title = currentMapItem.name
                annotation.coordinate = currentMapItem.placemark.coordinate
                self.mapView.addAnnotation(annotation)
            }
        }
    }
    
}
