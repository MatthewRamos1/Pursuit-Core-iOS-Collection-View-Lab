//
//  ViewController.swift
//  Collection-View-Lab
//
//  Created by Matthew Ramos on 1/14/20.
//  Copyright © 2020 Matthew Ramos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var countries = [Country]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        countries = Country.getCountries()
    }


}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        countries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "countryCell", for: indexPath) as? CountryCell else {
            fatalError("Couldn't typecast as CountryCell")
        }
            let country = countries[indexPath.row]
            cell.configureCell(country: country)
        return cell
    }
    
    
}

