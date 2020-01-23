//
//  CountryAPIClient.swift
//  Collection-View-Lab
//
//  Created by Matthew Ramos on 1/23/20.
//  Copyright © 2020 Matthew Ramos. All rights reserved.
//

import Foundation
import NetworkHelper

struct CountryAPIClient {
    static func fetchCountries(completion: @escaping (Result<[Country], AppError>) -> ()) {
        let endPointUrl = "https://restcountries.eu/rest/v2/name/united"
        guard let url = URL(string: endPointUrl) else {
            completion(.failure(.badURL(endPointUrl)))
            return
        }
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let countries = try JSONDecoder().decode([Country].self, from: data)
                    completion(.success(countries))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
                
                
            }
        }
        
    }
}
