//
//  ViewController.swift
//  DynamicApp
//
//  Created by Matthieu Guillemin on 15/10/2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var monTableView: UITableView!
    var etudiants: [Etudiant] = []
    var odRef: ODRefreshControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        etudiants.append(Etudiant(nom: "Ghomashi", prenom: "Houman", formation: "M2CIM", groupeTP: "A", nbAbs: 50))
        etudiants.append(Etudiant(nom: "Andria", prenom: "Tefy", formation: "M2CIM", groupeTP: "B", nbAbs: 100))
        etudiants.append(Etudiant(nom: "Hostache", prenom: "Guillaume", formation: "M2CIM", groupeTP: "C", nbAbs: 0))
        etudiants.append(Etudiant(nom: "Guillemin", prenom: "Matthieu", formation: "M2CIM", groupeTP: "D", nbAbs: 10))
        
        monTableView.delegate = self
        monTableView.dataSource = self
        monTableView.rowHeight = 150
        
        odRef = ODRefreshControl(in: monTableView)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return etudiants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let uneCellule = monTableView.dequeueReusableCell(withIdentifier: "idCelluleEtudiant") as! CelluleEtudiant
        uneCellule.majInfosEtu(unEtudiant: etudiants[indexPath.item])
        if (indexPath.row % 2 == 0) {
            uneCellule.backgroundColor = .lightGray
        } else {
            uneCellule.backgroundColor = .white
        }
        return uneCellule
    }

}
