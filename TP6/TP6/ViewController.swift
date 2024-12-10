//
//  ViewController.swift
//  TP6
//
//  Created by Matthieu Guillemin on 10/12/2024.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var monChampTexte: UITextView!
    @IBOutlet weak var maMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        maMap.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func chargementDonnees(_ sender: Any) {
        miseAjourData(controlleur: self)
    }
    
    func analyseData() {
        let tabLignes = monChampTexte.text.components(separatedBy: "\n")
        
        for ligne in tabLignes {
            let tabInfos = ligne.components(separatedBy: " ")
            
            if (tabInfos.count > 3) {
                if  let latitude = Double(tabInfos[2]),
                    let longitude = Double(tabInfos[3]) {
                    
                    print("Latitude : \(latitude), Longitude : \(longitude)")
                    
                    let coords = CLLocationCoordinate2D(
                        latitude: CLLocationDegrees(latitude),
                        longitude: CLLocationDegrees(longitude)
                    )
                    
                    let lightningImpact = LightningImpact(
                        coordinate: coords,
                        title: tabInfos[0],
                        subtitle: tabInfos[4]
                    )
                    
                    maMap.addAnnotation(lightningImpact)
                    
                } else {
                    print("Coordonnées invalides pour la ligne : \(ligne)")
                }
            } else {
                print("Ligne mal formée : \(ligne)")
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let resultat = MKAnnotationView(annotation: annotation, reuseIdentifier: " Lightning")
        resultat.image = UIImage(named: "lightningIconColor0-2")
        return resultat
    }
}
