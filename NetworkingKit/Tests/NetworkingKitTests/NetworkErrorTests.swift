//
//  NetworkErrorTests.swift
//  
//
//  Created by Khan on 21/07/2024.
//

import XCTest
@testable import NetworkingKit

class NetworkErrorTests: XCTestCase {

    func testInvalidRequestError() {
        let error = NetworkError.invalidRequest
        XCTAssertEqual(error.localizedDescription, NSLocalizedString("The request is invalid.", comment: ""))
    }
    
    func testInvalidDataError() {
        let error = NetworkError.invalidData
        XCTAssertEqual(error.localizedDescription, NSLocalizedString("The data is invalid.", comment: ""))
    }
    
    func testInvalidResponseError() {
        let error = NetworkError.invalidResponse
        XCTAssertEqual(error.localizedDescription, NSLocalizedString("The response is invalid.", comment: ""))
    }
    
    func testUrlError() {
        let underlyingError = NSError(domain: "TestDomain", code: 123, userInfo: nil)
        let error = NetworkError.urlError(underlyingError)
        XCTAssertEqual(error.localizedDescription, underlyingError.localizedDescription)
    }
}
