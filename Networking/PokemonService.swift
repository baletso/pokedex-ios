import Foundation

class PokemonService {
    func fetchPokemonList(completion: @escaping ([Pokemon]?) -> Void) {
        let urlString = "https://pokeapi.co/api/v2/pokemon?limit=20"
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,
                  error == nil else {
                completion(nil)
                return
            }
            do {
                
                struct PokemonResponse: Decodable {
                    let results: [PokemonResult]
                }
                struct PokemonResult: Decodable {
                    let name: String
                    let url: String
                }
                
                let response = try JSONDecoder().decode(PokemonResponse.self, from: data)
                
                let pokemons = response.results.map { Pokemon(id: 0, name: $0.name, sprites: Sprite(front_default: "")) }
                completion(pokemons)
            } catch {
                completion(nil)
            }
        }.resume()
    }
}//
//  PokemonService.swift
//  pokedex-ios
//
//  Created by Bárbara Letelier on 20-07-25.
//

