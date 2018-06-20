//
//  Place.swift
//  MapTask
//
//  Created by Nazhmeddin Babakhanov on 3/15/18.
//  Copyright © 2018 Nazhmeddin Babakhanov. All rights reserved.
//

import Foundation
import MapKit
class Place{
    var title: String?
    var subtitle: String?
    var location: CLLocationCoordinate2D?
    var currentData = NSDate()
    init(_ title: String, _ subtitle: String, _ location: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.location = location
        self.currentData = NSDate()
    }
}

