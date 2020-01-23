//
//  CountryData.swift
//  ConcurrencyLab
//
//  Created by Matthew Ramos on 12/9/19.
//  Copyright © 2019 Matthew Ramos. All rights reserved.
//

import UIKit

struct Country: Decodable {
    let name: String
    let capital: String
    let population: Int
    let alpha2Code: String
    let currencies: [Currency]
    var flagURL: String {
        return "https://www.countryflags.io/\(alpha2Code)/flat/64.png"
    }
    
}

struct Currency: Decodable {
    let code: String
    let name: String
    let symbol: String
}

extension Country {
    
    func populationFormatter() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value:population)) ?? "Error"
    }
}
