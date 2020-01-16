//
//  DetailViewController.swift
//  Collection-View-Lab
//
//  Created by Matthew Ramos on 1/16/20.
//  Copyright © 2020 Matthew Ramos. All rights reserved.
//

import UIKit
import ImageKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    
    var country: Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    func updateUI() {
        if let detailCountry = country {
            capitalLabel.text = detailCountry.capital
            populationLabel.text = detailCountry.populationFormatter()
            flagImage.getImage(with: detailCountry.flagURL) { [weak self] (result) in
                switch result {
                case .failure:
                    self?.flagImage.image = UIImage(systemName: "xmark.icloud")
                case .success(let image):
                    self?.flagImage.image = image
                }
            }
            
        }
    }
}
