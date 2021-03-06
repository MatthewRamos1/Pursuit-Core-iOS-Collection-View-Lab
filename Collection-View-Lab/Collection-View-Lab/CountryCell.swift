//
//  CountryCell.swift
//  Collection-View-Lab
//
//  Created by Matthew Ramos on 1/16/20.
//  Copyright © 2020 Matthew Ramos. All rights reserved.
//

import UIKit
import ImageKit

class CountryCell: UICollectionViewCell {
    
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    
    func configureCell(country: Country) {
        countryNameLabel.text = country.name
        capitalLabel.text = country.capital
        populationLabel.text = country.populationFormatter()
        flagImage.getImage(with: country.flagURL) { [weak self] (result) in
            switch result {
            case .failure:
                DispatchQueue.main.async {
                    self?.flagImage.image = UIImage(systemName: "xmark.icloud")
                }
            case .success(let image):
                DispatchQueue.main.async {
                    self?.flagImage.image = image
                }
            }
        }
    }
}
