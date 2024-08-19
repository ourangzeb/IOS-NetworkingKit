//
//  NetworkErrorTests.swift
//  
//
//  Created by Khan on 19/08/2024.
//

import XCTest
@testable import NetworkingKit
final class NetworkErrorTests: XCTestCase {
    
    
    
    func testInvalidRequestErrorDescription() {
        
        let error = NetworkError.invalidRequest
        XCTAssertEqual(error.localizedDescription, "The request is invalid.")

    }
    
    
    func testinvalidDataErrorDescrion() {
        let error = NetworkError.invalidData
        XCTAssertEqual(error.localizedDescription, "The data is invalid.")
    }
    func testinvalidResponseErrorDescrion() {
        let error = NetworkError.invalidResponse
        XCTAssertEqual(NetworkError.invalidResponse.localizedDescription, "The response is invalid.")
    }
    func testUrlErrorDescription() {
            let underlyingError = NSError(domain: "TestDomain", code: 999, userInfo: [NSLocalizedDescriptionKey: "A URL error occurred."])
            let error = NetworkError.urlError(underlyingError)
            XCTAssertEqual(error.localizedDescription, "A URL error occurred.")
        }
    
    
}
