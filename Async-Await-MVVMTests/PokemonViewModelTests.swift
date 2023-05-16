//
//  WorkingWithAPI_SwiftUITests.swift
//  WorkingWithAPI-SwiftUITests
//
//  Created by Glenn Ludszuweit on 24/04/2023.
//

import XCTest
@testable import WorkingWithAPI_SwiftUI

final class PokemonViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPokemonViewModel_GoodData() async throws {
        let pokemonViewModel = await PokemonViewModel(manager: FakeNetworkManager())
        let fetchData: () = await pokemonViewModel.getAll("pokemon")
        let data = await pokemonViewModel.pokemons
        
        XCTAssertNotNil(data)
        XCTAssertNoThrow(fetchData)
        XCTAssertEqual(data.count, 15)
    }
    
    func testPokemonViewModel_BadData() async throws {
        let pokemonViewModel = await PokemonViewModel(manager: FakeNetworkManager())
        await pokemonViewModel.getAll("empty")
        let data = await pokemonViewModel.pokemons
        
        XCTAssertEqual(data.count, 0)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
