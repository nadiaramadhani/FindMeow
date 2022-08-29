//
//  APIServic.swift
//  API trial dicoding
//
//  Created by Local Administrator on 13/08/22.
//

import Foundation


struct Cats: Codable, Identifiable {
    
    let id: String
    let name: String
    let origin: String
    let description: String
    let image: CatImage?
    let temperament: String?
    let wikipedia_url: String?
    let adaptability: Int
    let energy_level: Int
    let intelligence: Int
    let dog_friendly: Int
}

struct CatImage: Codable {
    let id: String
    let url: String
}


class APIService: ObservableObject {
    
    @Published var cats = [Cats]()
    
    func fetch() {
        guard let url = URL(string: "https://api.thecatapi.com/v1/breeds") else {return}
        
        let task = URLSession.shared.dataTask(with: url){ data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let cat = try JSONDecoder().decode([Cats].self, from: data)
                DispatchQueue.main.async {
                    self.cats = cat
                }
                
            } catch{
                print("failed to load cats data")
            }
            
            
            
            
        }
        task.resume()
    }
}
