//
//  Etudiant.swift
//  DynamicApp
//
//  Created by Matthieu Guillemin on 15/10/2024.
//

import Foundation

class Etudiant {
    var photo: String
    var nom: String
    var prenom: String
    var formation: String
    var groupeTP: String
    var nbAbs: Int = 0

    init(nom: String, prenom: String, formation: String, groupeTP: String, nbAbs: Int) {
        self.photo = "photoEtudiant.png"
        self.nom = nom
        self.prenom = prenom
        self.formation = formation
        self.groupeTP = groupeTP
        self.nbAbs = nbAbs
    }
}
