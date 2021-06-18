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
    
    
    func testCallBackIsCalled() throws {
        
        let promise = expectation(description: "Call back is Called for Place service")
        
        let coordinate = (lat: 38.897675, long: -77.036547)
        
        sut.getPlaces(with: coordinate) { result in
            
            promise.fulfill()
        }
        
        wait(for: [promise], timeout: 10)
    }
    
    func testResponseModel() throws {
        
        let promise = expectation(description: "Test Place service respone: response must be place array")
        
        let coordinate = (lat: 38.897675, long: -77.036547)
        
        sut.getPlaces(with: coordinate) { result in
            
            
            switch result {
            
            case .failure(let error):
                
                XCTFail("Error: \(error.localizedDescription)")
                return
                
            case .success(_):
                    promise.fulfill()
            }
        }
        
        wait(for: [promise], timeout: 10)
    }
    
    
}
