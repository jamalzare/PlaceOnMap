//
//  PlaceServiceTests.swift
//  PlaceOnMapAppTests
//
//  Created by Jamal on 6/18/21.
//

import Foundation
import XCTest
@testable import PlaceOnMapApp

class PlaceServiceTests: XCTestCase {
    
    var sut: PlaceService! // sut: system under test
    private let request = URLRequest.createRequest(url: "https://postman-echo.com/get?test=123", type: "GET")
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        let loader = NetworkLoader()
        sut = PlaceService(networkLoader: loader)
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        try super.tearDownWithError()
    }
    
}
