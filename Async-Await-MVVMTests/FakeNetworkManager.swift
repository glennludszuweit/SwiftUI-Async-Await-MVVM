//
//  FakeNetworkManager.swift
//  WorkingWithAPI-SwiftUITests
//
//  Created by Glenn Ludszuweit on 25/04/2023.
//

import Foundation
@testable import WorkingWithAPI_SwiftUI

class FakeNetworkManager: NetworkProtocol {
    func getAll(apiURL: URL) async throws -> Data {
        let bundle = Bundle(for: FakeNetworkManager.self)
        guard let path = bundle.url(forResource: apiURL.absoluteString, withExtension: "json") else { throw ErrorHandler.parsingError }
        
        do {
            let data = try Data(contentsOf: path)
            return data
        } catch {
            throw ErrorHandler.apiEndpointError
        }
    }
}
