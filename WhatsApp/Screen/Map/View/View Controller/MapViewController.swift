//
//  MapViewController.swift
//  WhatsApp
//
//  Created by abcd on 13/11/24.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var nearByLocationTableView: UITableView!{
        didSet{
            nearByLocationTableView.register(UINib(nibName: CellConstant.CellIdentifier.PlacesTableViewCell, bundle: nil), forCellReuseIdentifier: CellConstant.CellIdentifier.PlacesTableViewCell)
            
            nearByLocationTableView.register(UINib(nibName: CellConstant.CellIdentifier.CurrentLocationTableViewCell, bundle: nil), forCellReuseIdentifier: CellConstant.CellIdentifier.CurrentLocationTableViewCell)
        }
    }
    
    var loactionManager = CLLocationManager()
    var places: [MKMapItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMapView()
        setupLocationManager()
        fetchNearbyPlaces()
        
    }
    func setupMapView(){
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        
    }
    func setupLocationManager(){
        loactionManager.delegate = self
        loactionManager.desiredAccuracy = kCLLocationAccuracyBest
        loactionManager.requestWhenInUseAuthorization()
        fetchNearbyPlaces()
        
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let status = CLLocationManager.authorizationStatus()
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            loactionManager.startUpdatingLocation()
        case .denied, .restricted:
            print("Location permissions denied.")
        case .notDetermined:
            loactionManager.requestWhenInUseAuthorization()
        @unknown default:
            break
        }
    }
    func fetchNearbyPlaces(for location: CLLocation? = nil){
        guard let userLocation = location ?? loactionManager.location else { return}
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = "restaurants"
        request.region = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        
        let search = MKLocalSearch(request: request)
        search.start { [weak self] response, error in
            guard let response = response, error == nil else {
                print("Error in local search: \(String(describing: error))")
                return
            }
    
            self?.places = response.mapItems
            self?.nearByLocationTableView.reloadData()
            
            print("Fetched places count: \(self?.places.count ?? 0)")
        }
    }
    func iconForPlaceType(category: MKPointOfInterestCategory?) -> UIImage? {
            guard let category = category else { return UIImage(systemName: "mappin.circle") }
            
            switch category {
            case .cafe:
                return UIImage(systemName: "cup.and.saucer")
            case .restaurant:
                return UIImage(systemName: "fork.knife")
            case .park:
                return UIImage(systemName: "leaf")
            case .store:
                return UIImage(systemName: "bag")
            default:
                return UIImage(systemName: "mappin.circle")
            }
        }
    

}
extension MapViewController: CLLocationManagerDelegate, MKMapViewDelegate, UITableViewDelegate, UITableViewDataSource{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else{ return }
        print("Location updated to: \(location.coordinate.latitude), \(location.coordinate.longitude)")
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(region, animated: true)
        fetchNearbyPlaces(for: location)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Number of places found: \(places.count)")
        if section == 0{
            return 1
        }else{
            return places.count
        }
        
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            let currentLocationTableViewCell = self.nearByLocationTableView.dequeueReusableCell(withIdentifier: CellConstant.CellIdentifier.CurrentLocationTableViewCell) as! CurrentLocationTableViewCell
            
            return currentLocationTableViewCell
            
        }else {
            let placesTableViewCell = self.nearByLocationTableView.dequeueReusableCell(withIdentifier: CellConstant.CellIdentifier.PlacesTableViewCell) as! PlacesTableViewCell
            
            let place = places[indexPath.row]
            placesTableViewCell.placeNameLabel.text = place.name
            placesTableViewCell.placeAddressLabel.text = place.placemark.title
            placesTableViewCell.placeImageView.image = iconForPlaceType(category: place.pointOfInterestCategory)
            return placesTableViewCell
        }
       
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 100
        }else{
            return 80
        }
    }
    
    
}
