//
//  ViewController.swift
//  MapWithData
//
//  Created by Nazhmeddin Babakhan on 14.03.2018.
//  Copyright © 2018 Nolan. All rights reserved.
//

import UIKit
import MapKit
import Cartography
import CoreData

protocol SelectedPlace {
    var editableAnnotation: MKPointAnnotation {get set}
    var editablePlace: Places {get set}
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MKMapViewDelegate, SelectedPlace {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var editableAnnotation = MKPointAnnotation()
    var editablePlace = Places()
    var tableViewForReload: UITableView = UITableView()
    
    private var globalIndex = 0
    
    private var places: [Places] = []
    private var annotations: [MKPointAnnotation] = []
    private var index = 0
    
    private var tableHidden = [
        false : true,
        true : false
    ]
    
    private var mapTypes = [
        0 : MKMapType.satellite,
        1 : MKMapType.standard,
        2 : MKMapType.hybrid
    ]
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    lazy var mapView: MKMapView = {
        let map = MKMapView()
        let annotation = MKPointAnnotation()
        let coordinate = CLLocationCoordinate2D(latitude: 43.238949, longitude: 76.889709)
        map.delegate = self
        map.setRegion(MKCoordinateRegionMakeWithDistance(coordinate, 1000, 1000), animated: true)
        return map
    }()
    
    lazy var segmentControl: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["Satellite", "Standard", "Hybrid"])
        segment.tintColor = .cyan
        segment.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        segment.selectedSegmentIndex = 1
        segment.addTarget(self, action: #selector(changeMapType), for: .valueChanged)
        return segment
    }()
    
    lazy var nextPlace: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        button.addTarget(self, action: #selector(moveToNextPlace), for: .touchUpInside)
        return button
    }()
    
    lazy var prevPlace: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        button.addTarget(self, action: #selector(moveToPrevPlace), for: .touchUpInside)
        return button
    }()
    
    lazy var longPressGesture: UILongPressGestureRecognizer = {
        let long = UILongPressGestureRecognizer()
        long.addTarget(self, action: #selector(addPlaceInMap))
        return long
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        editableAnnotation.title = "Not changed"
        
        navigationItem.title = "World"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(showAllPlaces))
        
        view.addSubViews([mapView, tableView, segmentControl, nextPlace, prevPlace])
        
        setupTableViewController()
        changeAnyLayers()
        addConstraints()
        
        
        do {
            let result = try context.fetch(Places.fetchRequest())
            places = result as! [Places]
            setupSavedAnnotations(places)
            
        } catch {
            print("Some problem with getting data")
        }
        
    }
    
    private func changeAnyLayers() {
        
        mapView.addGestureRecognizer(longPressGesture)
        tableView.isHidden = true
        
    }
    
    private func addConstraints(){
        
        constrain(view, mapView) { v1, v2 in
            v2.width == v1.width
            v2.height == v1.height
            v2.center == v1.center
        }
    
        constrain(view, tableView){ v1, v2 in
            v2.width == v1.width
            v2.height == v1.height
            v2.center == v1.center
        }
        
        constrain(view, segmentControl) { v1, v2 in
            v2.centerX == v1.centerX
            v2.bottom == v1.bottom
            v2.width == v1.width/5 * 3
            v2.height == 40
        }
        
        constrain(segmentControl, nextPlace, prevPlace) { v1, v2, v3 in
            v2.left == v1.right
            v2.centerY == v1.centerY
            v2.width == v1.width/3
            v2.height == v1.height
            
            v3.right == v1.left
            v3.centerY == v1.centerY
            v3.width == v1.width/3
            v3.height == v1.height
        }
        
    }
    
    @objc private func addPlaceInMap(_ sender: UILongPressGestureRecognizer) {
        let tappedPlace = sender.location(in: mapView)
        let coordinate = mapView.convert(tappedPlace, toCoordinateFrom: mapView)
        
        let alertController = UIAlertController(title: "New Place", message: "Fill all fields", preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Title"
        }

        alertController.addTextField { (textField) in
            textField.placeholder = "Subtitle"
        }
        
        alertController.addAction(UIAlertAction(title: "Add", style: .default, handler: { (sender) in
            if alertController.textFields![0].text != "" {
                let title = alertController.textFields![0].text
                let subTitle = alertController.textFields![1].text
                self.saveData(title!, subTitle!, coordinate)
                self.createAnnotation(title!, subTitle!, coordinate)
                self.tableView.reloadData()
                self.navigationItem.title = title
            }
        }))
        
        present(alertController, animated: true, completion: nil)
    }
    
    private func saveData(_ title: String, _ subtitle: String, _ coordinate: CLLocationCoordinate2D) {
        
        let place = Places(entity: Places.entity(), insertInto: context)
        place.setValue(title, forKey: "title")
        place.setValue(subtitle, forKey: "subtitle")
        place.setValue(coordinate.latitude, forKey: "latitude")
        place.setValue(coordinate.longitude, forKey: "longitude")
        
        do {
            try context.save()
            places.append(place)
        } catch {
            print("Some error with saving data")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        
        if editableAnnotation.title != "Not changed" {
            annotations[globalIndex] = editableAnnotation
            navigationItem.title = editableAnnotation.title
        }
        
    }

    private func setupTableViewController() {
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let place = places[indexPath.row]
        
        cell.textLabel?.text = place.title
        cell.detailTextLabel?.text = place.subtitle
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.isHidden = true
        let coordinate = CLLocationCoordinate2D(latitude: places[indexPath.row].latitude, longitude: places[indexPath.row].longitude)
        mapView.setRegion(MKCoordinateRegionMakeWithDistance(coordinate, 1000, 1000), animated: true)
        navigationItem.title = places[indexPath.row].title
        
        globalIndex = indexPath.row
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            mapView.removeAnnotation(annotations[indexPath.row])
            annotations.remove(at: indexPath.row)
            
            context.delete(places[indexPath.row])
            places.remove(at: indexPath.row)
            tableView.reloadData()
            do {
                try context.save()
            } catch {
                print("Some problems with saveing DATA")
            }
        }
    }
    
    @objc private func showAllPlaces() {
        tableView.reloadData()
        tableView.isHidden = tableHidden[tableView.isHidden]!
        navigationItem.title = "Places"
    }
    
    
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        navigationItem.title = (view.annotation?.title)!
        
        let annotation = view.annotation
        globalIndex = annotations.index(of: annotation as! MKPointAnnotation)!
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let pin  = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
        pin.canShowCallout = true
        pin.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        
        return pin
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        let annotation = view.annotation
        editableAnnotation = annotation as! MKPointAnnotation
        
        globalIndex = annotations.index(of: editableAnnotation)!
        editablePlace = places[globalIndex]
        
        let controller = EditViewController()
        controller.delegate = self
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc private func changeMapType(_ sender: UISegmentedControl) {
        mapView.mapType = mapTypes[sender.selectedSegmentIndex]!
    }
    
    @objc private func moveToNextPlace() {
        if (places.count != 0){
            globalIndex = globalIndex >= places.count - 1 ? 0 : globalIndex + 1
            let coordinateOfNextPlace = CLLocationCoordinate2D(latitude: places[globalIndex].latitude, longitude: places[globalIndex].longitude)
            
            mapView.setRegion(MKCoordinateRegionMakeWithDistance(coordinateOfNextPlace, 1000, 1000), animated: true)
            navigationItem.title = places[globalIndex].title
        }
    }
    
    @objc private func moveToPrevPlace() {
        if (places.count != 0){
            globalIndex = globalIndex <= 0 ? places.count - 1 : globalIndex - 1
            let coordinateOfPrevPlace = CLLocationCoordinate2D(latitude: places[globalIndex].latitude, longitude: places[globalIndex].longitude)
            
            mapView.setRegion(MKCoordinateRegionMakeWithDistance(coordinateOfPrevPlace, 1000, 1000), animated: true)
            navigationItem.title = places[globalIndex].title
        }
    }
    
    private func setupSavedAnnotations(_ savedPlaces: [Places]) {
        for place in savedPlaces {
            let coordinate = CLLocationCoordinate2D(latitude: place.latitude, longitude: place.longitude)
            createAnnotation(place.title!, place.subtitle!, coordinate)
        }
    }
    
}

extension UIView {
    func addSubViews(_ views: [UIView]){
        for view in views {
            self.addSubview(view)
        }
    }
}









