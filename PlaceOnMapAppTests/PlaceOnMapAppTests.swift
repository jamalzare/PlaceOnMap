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
    
    func testValidApiCallGetsHTTPStatusCode200() throws {
        
//        let promise = expectation(description: "Successful API Call")
//        
//        sut.loadRequest(request: WebApies.getPlace(with: "40.7638435", long: "-73.9729691"),
//                        identifier: "testApi",
//                        timeout: 30) { result in
//            
//            
//            switch result {
//            
//            case .failure(let error):
//                
//                XCTFail("Error: \(error.localizedDescription)")
//                print(error.localizedDescription)
//                return
//                
//            case .success(_):
//                promise.fulfill()
//                
//            }
//        }
//        
//        wait(for: [promise], timeout: 30)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
