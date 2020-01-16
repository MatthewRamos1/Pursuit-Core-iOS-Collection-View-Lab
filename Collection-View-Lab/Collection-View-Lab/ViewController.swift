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
        collectionView.delegate = self
        countries = Country.getCountries()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailViewController, let indexPath = collectionView.indexPath(for: sender as! CountryCell) else {
            fatalError("Error: Check prepare for segue")
        }
        detailVC.country = countries[indexPath.row]
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

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let interItemSpacing: CGFloat = 10
        let maxWidth = UIScreen.main.bounds.size.width
        let numberOfItems: CGFloat = 3
        let totalSpacing: CGFloat = numberOfItems * interItemSpacing
        let itemWidth: CGFloat = (maxWidth - totalSpacing) / numberOfItems
        
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
    }
}
