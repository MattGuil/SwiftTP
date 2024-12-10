//
//  LightningImpact.swift
//  TP6
//
//  Created by Matthieu Guillemin on 10/12/2024.
//

import UIKit
import MapKit

class LightningImpact: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String? = nil, subtitle: String? = nil) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }

}
