//
//  PokemonViewModel.swift
//  WorkingWithAPI-SwiftUI
//
//  Created by Glenn Ludszuweit on 24/04/2023.
//

import Foundation

@MainActor
class PokemonViewModel: ObservableObject {
    @Published var pokemons = [Pokemon]()
    @Published var customError: ErrorHandler?
    
    var manager: NetworkProtocol
    init(manager: NetworkProtocol) {
        self.manager = manager
    }
    
    func getAll(_ urlString: String = API.pokemonCardsApi) async {
        guard let url = URL(string: urlString) else {
            customError = ErrorHandler.invalidUrlError
            return
        }
        do {
            let result = try await self.manager.getAll(apiURL: url)
            let pokemondData = try JSONDecoder().decode(PokemonData.self, from: result)
            self.pokemons = pokemondData.data
        } catch let error {
            if error as? ErrorHandler == .parsingError {
                customError = ErrorHandler.parsingError
            } else {
                customError = ErrorHandler.apiEndpointError
            }
        }
    }
}
