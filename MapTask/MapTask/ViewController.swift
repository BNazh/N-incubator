//
//  ViewController.swift
//  MapTask
//
//  Created by Nazhmeddin Babakhanov on 3/15/18.
//  Copyright © 2018 Nazhmeddin Babakhanov. All rights reserved.
//
import UIKit
import MapKit
import Cartography

protocol talkDelegate{
    var places:[Place]{set get}
    var MapView:MKMapView{get set}
}
class ViewController: UIViewController,talkDelegate,MKMapViewDelegate {
    var a = 0
    var places: [Place] = []
    var MapView = MKMapView()
    private var styles : [Int: MKMapType] = [
        0: MKMapType.standard,
        1: MKMapType.satellite,
        2: MKMapType.hybrid
    ]
    lazy var gesture:UILongPressGestureRecognizer = {
        let gesture = UILongPressGestureRecognizer()
        return gesture
    }()
    lazy var Nextbutton:UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.addTarget(self, action: #selector(ViewController.Next(_:)), for: .touchUpInside)
        return button
    }()
    lazy var Previousbutton1:UIButton = {
        let button1 = UIButton()
        button1.setTitle("", for: .normal)
        button1.addTarget(self, action: #selector(ViewController.Previous(_:)), for: .touchUpInside)
        return button1
    }()
    lazy var viewEffect:UIVisualEffectView = {
        let viewE =  UIVisualEffectView(effect: UIBlurEffect(style: .light))
        viewE.isUserInteractionEnabled = false
        return viewE

    }()
    
    lazy var historyButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.bookmarks, target: self, action: #selector(openHistoryVC))
        return button
    }()
    
    lazy var sigmentController:UISegmentedControl = {
        let segment = UISegmentedControl()
        segment.backgroundColor = .blue
        segment.tintColor = .white
        segment.insertSegment(withTitle: "standard", at: 0, animated: true)
        segment.insertSegment(withTitle: "satellite", at: 0, animated: true)
        segment.insertSegment(withTitle: "standard", at: 0, animated: true)
        segment.layer.cornerRadius = 5
        segment.addTarget(self, action: #selector(ViewController.segmentController(_:)), for: .valueChanged)
        return segment
    }()
    
    @objc func segmentController(_ sender:UISegmentedControl!){
        print(sender.selectedSegmentIndex)
        MapView.mapType = styles[sender.selectedSegmentIndex]!
    }
  
    @objc private func openHistoryVC() {
        let controller = HistoryViewController()
        controller.delegate = self
        navigationController?.pushViewController(controller, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        MapView.frame = view.frame
        
        gesture.addTarget(self, action: #selector(ViewController.long_press_detected(_:)))
        MapView.isUserInteractionEnabled = true
        MapView.addGestureRecognizer(gesture)
        
        view.addSubview(MapView)
        
        MapView.delegate = self
        
        navigationItem.rightBarButtonItem = historyButton
        
        setupButton()
    }
    
    func setupButton() {
        view.addSubview(viewEffect)
        view.addSubview(Nextbutton)
        view.addSubview(Previousbutton1)
        view.addSubview(sigmentController)
        
        constrain(viewEffect,Nextbutton,Previousbutton1,sigmentController){z2,z1,z,z3 in
            z2.width == (z2.superview?.width)!
            z2.height == view.bounds.height/9
            z2.bottom == (z2.superview?.bottom)!
            
            
            z3.centerX == (z3.superview?.centerX)!
            z3.width == (z3.superview?.width)! - view.bounds.width/3
            z3.height == z2.height/2.5
            z3.centerY == z2.centerY

            z1.left == (z1.superview?.left)!
            z1.width == view.bounds.width/6
            z1.height ==  z2.height
            z1.centerY == z3.centerY

            z.right == (z1.superview?.right)!
            z.width == view.bounds.width/6
            z.height ==  z2.height
            z.centerY == z3.centerY
            
            distribute(by: 1, horizontally: z1,z3,z)
           
        }
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if (control == view.rightCalloutAccessoryView)
        {
            print("Button right pressed!")
            
            showInputDialog()
            
        }
        else if (control == view.leftCalloutAccessoryView)
        {
            print("Button left pressed!")
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let pin = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
        pin.canShowCallout = true
        pin.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        return pin
    }

    func showInputDialog() {
        
        let alertController = UIAlertController(title: "Enter", message: "Title or Subtitle", preferredStyle: .alert)
        
        
        let confirmAction = UIAlertAction(title: "Ok", style: .default) { (_) in
            
            let master = alertController.textFields?[0].text
            let confirm = alertController.textFields?[1].text
            
            if((master?.count)!>0 && (confirm?.count)!>0){
                let new_place = Place.init( master!, confirm!, self.places[self.a].location!)
                self.places.append(new_place)
                self.createAnnotation(new_place)
                self.MapView.removeAnnotation(self.MapView.annotations[self.a])
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter Master"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Confirm Password"
        }
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
     @objc func long_press_detected(_ sender: UILongPressGestureRecognizer!) {
        let current_loc = sender.location(in: MapView)
        let coordinate = MapView.convert(current_loc, toCoordinateFrom: MapView)
        let alert = UIAlertController(title: "New Place", message: "Enter title and subtitle", preferredStyle: .alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.placeholder = "Title"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Subtitle"
        }
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let title = alert?.textFields![0].text // Force unwrapping because we know it exists.
            let subtitle = alert?.textFields![1].text
            
            let new_place = Place.init(title!, subtitle!, coordinate)
            self.places.append(new_place)
            
            
            self.createAnnotation(new_place)
            
        }))
        
        
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    
    func createAnnotation(_ new_place: Place){
        let annotation = MKPointAnnotation()
        annotation.coordinate = new_place.location!
        annotation.title = new_place.title
        annotation.subtitle = new_place.subtitle
        MapView.addAnnotation(annotation)
        MapView.setRegion(MKCoordinateRegionMakeWithDistance(new_place.location!, 1000, 1000), animated: true)
        
    }
    
    
    @objc func Next(_ sender: UIButton!) {
        self.title =  places[a].title
        if(places.count>1){
            if places.count-1 == a {
                a = 0
            }
            else{
                a = a + 1
                
            }
            let place = places[a]
            MapView.setRegion(MKCoordinateRegionMakeWithDistance(place.location!, 1000, 1000), animated: true)
            
        }
    }
    
    @objc func Previous(_ sender: UIButton!) {
        self.title =  places[a].title
        if(places.count>1){
            if a == 0 {
                a = places.count - 1
            }
            else{
                a = a - 1
            }
            let place = places[a]
            MapView.setRegion(MKCoordinateRegionMakeWithDistance(place.location!, 1000, 1000), animated: true)
            
        }
    }
    
    
    


}

