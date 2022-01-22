//
//  NetworkManager.swift
//  BBChars
//
//  Created by Yuri Ershov on 22.01.22.
//

import Foundation


class NetworkManager {
    func getCharacters(completion: @escaping (Result<[Character], Error>) -> Void)   {
        let urlString = "https://www.breakingbadapi.com/api/characters?limit=10"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            
            do {
                let obj = try JSONDecoder().decode([Character].self, from: data!)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
