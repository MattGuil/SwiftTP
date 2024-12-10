//
//  dataTools.swift
//  TP6
//
//  Created by Matthieu Guillemin on 10/12/2024.
//

import Foundation

func miseAjourData(controlleur: ViewController){
    // A compléter question 2.1 a): Creation URL
    let url = URL(string: "https://kerautret.github.io/SiteVrac/strikeSample.dat")
    var contenuFichier = ""
    
    let task = URLSession.shared.dataTask(with: url!) { [controlleur] data,
        response,
        error in
        if error != nil {
            print(error!.localizedDescription)
        }else{
            DispatchQueue.main.async {
                // A compléter question 2.1 b): construire un String à partir des data
                //                               et l'enregistrer dans contenuFichier
                if let data = data {
                    contenuFichier = String(data: data, encoding: .utf8)!
                }
                
                // A compléter question 2.1 c): Mettre à jour le champ texte du controlleur
                controlleur.monChampTexte.text = contenuFichier
                
                controlleur.analyseData()
            }
        }
    }
    task.resume()
}
