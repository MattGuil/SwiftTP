//
//  CelluleEtudiant.swift
//  DynamicApp
//
//  Created by Matthieu Guillemin on 15/10/2024.
//

import UIKit

class CelluleEtudiant: UITableViewCell {

    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var nom: UILabel!
    @IBOutlet weak var prenom: UILabel!
    @IBOutlet weak var formation: UILabel!
    @IBOutlet weak var groupe: UILabel!
    @IBOutlet weak var nbAbs: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib();
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func majInfosEtu(unEtudiant: Etudiant) {
        nom.text = unEtudiant.nom
        prenom.text = unEtudiant.prenom
        formation.text = unEtudiant.formation
        groupe.text = unEtudiant.groupeTP
        nbAbs.text = String(unEtudiant.nbAbs)
        photo.image = UIImage(named: unEtudiant.photo)
    }

}
