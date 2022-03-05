//
//  DetailsViewController.swift
//  SuperHeroBook
//
//  Created by Barkın Süngü on 17.02.2022.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var selectedHeroName = ""
    var selectedHeroImageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: selectedHeroImageName)
        label.text = selectedHeroName
    }
    


}
