//
//  PokedexViewModel.swift
//  MyPokedex
//
//  Created by richard Haynes on 2/17/23.
//
// Dittio Example https://pokeapi.co/api/v2/pokemon/ditto
// https://www.youtube.com/watch?v=dVtnFH4m_fE
// https://www.hackingwithswift.com/quick-start/concurrency/how-to-run-tasks-using-swiftuis-task-modifier

import Foundation
final class PokedexViewModel: ObservableObject{
    @Published var pokemonResults: [Pokemon] = []
    private let baseUrlString: String = "https://pokeapi.co/api/v2/pokemon/"
    private var session = URLSession.shared
    
    func fetchPokemon(by name : String) {
        let pokemonSearchUrl = "\(baseUrlString)\(name.lowercased())"
        
        guard let url = URL(string: pokemonSearchUrl) else {return}
        
        
        let task = session.dataTask(with: url){
            [weak self]data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let pokemon = try JSONDecoder().decode(Pokemon.self, from: data)
                DispatchQueue.main.async {
                    self?.pokemonResults.append(pokemon)
                }
            }
            catch{
                print(error)
            }
        }
        task.resume()
    }
    
    func fetchPokemonSpecies(by urlString: String) async throws -> species?{
        guard let url = URL(string: urlString) else {return nil}
        let (data , _) = try await session.data(from: url)
        let decoder = JSONDecoder()
        return try decoder.decode(species.self, from: data)
    }
    
}
