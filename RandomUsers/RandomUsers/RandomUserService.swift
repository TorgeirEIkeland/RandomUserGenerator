//
//  File.swift
//  RandomUsers
//
//  Created by Torgeir Eikeland on 15/08/2022.
//

import Foundation

class RandomUserService: ObservableObject {
    
    let randomUserUrl: String = "https://randomuser.me/api/"
    

    
    
    func getData(callback: @escaping (RandomUser) -> Void) {
        if let url = URL(string: randomUserUrl) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase //MARK: convert from snakeCase to camelCase
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(RandomUser.self, from: safeData)
                            DispatchQueue.main.async {
                                callback(results)
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
