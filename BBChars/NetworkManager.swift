//
//  NetworkManager.swift
//  BBChars
//
//  Created by Yuri Ershov on 22.01.22.
//

import Foundation
import UIKit


final class NetworkManager {
    static let shared = NetworkManager()
    private let urlString = "https://www.breakingbadapi.com/api/characters?limit=10"
    
    private init() {}
    
    // function that does all - fetch, decode data and allow to use closures with Result obj.
    func getCharacters(completion: @escaping (Result<[Character], Error>) -> Void)   {
        
        
        // check for a valid URL
        guard let url = URL(string: urlString) else { return }
        
        // create dataTask with results
        URLSession.shared.dataTask(with: url) { data, responce, error in
            if let error = error {
                completion(.failure(error))
            }
            
            // check if there was an invalid responce code
            guard let responce = responce as? HTTPURLResponse, responce.statusCode == 200 else {
                return
            }

            
            // try to decode fetched data
            do {
                let obj = try JSONDecoder().decode([Character].self, from: data!)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    // function for retrieve image from URL
    func getImage(fromURLString: String, completion: @escaping (UIImage?) -> Void) {
        
        guard let url = URL(string: fromURLString) else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            // check for a valid downloaded image
            guard let data = data, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            completion(image)
        }
        task.resume()
    }
}
