//
//  PlaceOnMapAppTests.swift
//  PlaceOnMapAppTests
//
//  Created by Jamal on 6/16/21.
//

import XCTest
@testable import PlaceOnMapApp

class PlaceOnMapAppTests: XCTestCase {
    
    
    var sut: NetworkLoader! // sut: system under test
    private let request = URLRequest.createRequest(url: "http://www.randomnumberapi.com/test", type: "GET")
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        sut = NetworkLoader()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        try super.tearDownWithError()
    }
    
    func testNetworkConnection() throws {
        
        let promise = expectation(description: "Network Concection is reachable")
        
        sut.loadRequest(request: request,
                        identifier: "testApi",
                        timeout: 10) { result in
            
            
            switch result {
            
            case .failure(let error):
                
                if error.errorKind == .connectionError {
                    XCTFail("Error: \(error.localizedDescription)")
                    
                } else {
                    promise.fulfill()
                }
                
                return
                
            case .success(_):
                promise.fulfill()
                
            }
        }
        
    }
    
    func testApiCallCompletes() throws {
        
        var success: Bool?
        var responseError: Error?
        
        let promise = expectation(description: "Completion handler invoked")
        
        sut.loadRequest(request: request,
                        identifier: "testApi",
                        timeout: 10) { result in
            
            promise.fulfill()
            
            switch result {
            
            case .failure(let error):
                responseError = error
                return
                
            case .success(_):
                success = true
                
            }
            
        }
        
        wait(for: [promise], timeout: 10)
        
        XCTAssertNil(responseError)
        XCTAssertEqual(success, true)
        
    }
    
    func testSuccessfullAPICAll() throws {
        
        let promise = expectation(description: "Successful API Call")
        
        sut.loadRequest(request: request,
                        identifier: "testApi",
                        timeout: 10) { result in
            
            
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
