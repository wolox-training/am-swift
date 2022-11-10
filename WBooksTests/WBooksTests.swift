//
//  WBooksTests.swift
//  WBooksTests
//
//  Created by ana.mancuso on 19/09/2022.
//

import XCTest
@testable import WBooks


final class WBooksTests: XCTestCase {

    var sut: URLSession!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = URLSession(configuration: .default)

    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testExample() throws {
        
    }

    func testPerformanceExample() throws {
        self.measure {
        }
    }
    
    func testStatusSuccess() throws {
        let library = Library(id: 0, name: "", name2: "", genre: "", year: "", status: "Available", photo: "")
        let bookInfoViewModel = BookInfoViewModel(bookDetails: library)
        
        XCTAssertTrue(bookInfoViewModel.isAvailable())
    }
    
}
