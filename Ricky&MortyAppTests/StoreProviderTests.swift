//
//  Ricky_MortyAppTests.swift
//  Ricky&MortyAppTests
//
//  Created by Andy Heredia on 23/12/24.
//

import XCTest

@testable import Ricky_MortyApp
final class StoreProviderTests: XCTestCase {
    
    var sut: StoreDataProvider!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = StoreDataProvider(persistency: .inMemory)
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func test_addCharacters_ShouldReturnCharacters_WhenSuccessful() async throws {
        // Given - Arrange
        
        let characters = [Characters.sampler, Characters.sampler]
        // When - Act
        sut.addCharacters(characters: characters)
        // Then - Assert
        let initialCount = sut.fetchCharactersWithNonNilId()
        XCTAssertEqual(initialCount.count, 1)
    }


}
