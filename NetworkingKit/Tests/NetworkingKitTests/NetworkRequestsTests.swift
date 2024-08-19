//
//  NetworkRequestsTests.swift
//  
//
//  Created by Khan on 19/08/2024.
//

import XCTest
@testable import NetworkingKit
struct TestModel: Decodable {
    let key1: String
    let key2: String
}
final class NetworkRequestsTests: XCTestCase {

    
    
                
    func testGETRequestWithoutParameters() {
        guard let url = URL(string: ApiConstants.baseUrl) else { return
            XCTFail()
        }
         let networkRequest = NetworkRequest<TestModel>.init(url: url)
        XCTAssertEqual(networkRequest.url.absoluteString, ApiConstants.baseUrl)
        XCTAssertEqual(networkRequest.httpMethod.rawValue, "GET")
        XCTAssertNil(networkRequest.request?.httpBody, "GET request should not have abody")
    }
    
    func testGETRequestWithParameters() {
        guard let url = URL(string: ApiConstants.baseUrl) else { return
            XCTFail()
        }
        let parameters: [String: CustomStringConvertible] = ["key": "value"]
        let networkRequest = NetworkRequest<TestModel>.init(url: url, parameters: parameters, httpMethod: .post)
        XCTAssertEqual(networkRequest.url.absoluteString, ApiConstants.baseUrl)
        XCTAssertEqual(networkRequest.httpMethod.rawValue, "POST")
        // Convert parameters to JSON data
        let jsonData: Data
        do {
            jsonData = try JSONSerialization.data(withJSONObject: parameters, options: [])
        } catch {
            XCTFail("Failed to serialize parameters to JSON data: \(error)")
            return
        }
        XCTAssertEqual(networkRequest.request?.httpBody,jsonData )
    }
    
    
    
    
    
    
}
