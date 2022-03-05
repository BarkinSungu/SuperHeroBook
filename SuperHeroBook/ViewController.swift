//
//  ViewController.swift
//  SuperHeroBook
//
//  Created by Barkın Süngü on 5.01.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var superHeroNames = [String]()
    var superHeroImageNames = [String]()
    
    var selectedName = ""
    var selectedImage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        superHeroNames = [String](arrayLiteral: "Batman", "Superman", "Wolverine", "Iron Man")
        
        //superHeroNames.append("Batman") //bir diğer ekleme yöntemi
        
        superHeroImageNames = [String](arrayLiteral: "batman", "superman", "wolwerine", "ironman")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superHeroNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = superHeroNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            superHeroNames.remove(at: indexPath.row)
            superHeroImageNames.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedName = superHeroNames[indexPath.row]
        selectedImage = superHeroImageNames[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.selectedHeroName = selectedName
            destinationVC.selectedHeroImageName = selectedImage
        }
    }
}

