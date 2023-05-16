//
//  Async_Await_MVVMApp.swift
//  Async-Await-MVVM
//
//  Created by Glenn Ludszuweit on 16/05/2023.
//

import SwiftUI

@main
struct Async_Await_MVVMApp: App {
    var body: some Scene {
        WindowGroup {
            PokemonGalleryView(pokemonViewModel: PokemonViewModel(manager: NetworkManager()))
        }
    }
}
