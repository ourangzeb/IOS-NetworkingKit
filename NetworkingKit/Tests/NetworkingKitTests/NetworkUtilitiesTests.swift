//
//  NetworkUtilitiesTests.swift
//  
//
//  Created by Khan on 21/07/2024.
//

import XCTest
@testable import NetworkingKit

final class NetworkUtilitiesTests: XCTestCase {
    
    
    
    
    
    func testResourceRequest() {
    
        
        let url = URL(string: "https://api.example.com/resource")!
               let parameters: [String: CustomStringConvertible] = ["query": "test", "page": 1]
               let resource = Resource<Decodable>(url: url, parameters: parameters, httpMethod: .get)
               
               guard let request = resource.makeRequest() else {
                   XCTFail("Failed to create URLRequest")
                   return
               }
               
               XCTAssertEqual(request.url?.absoluteString, "https://api.example.com/resource?query=test&page=1")
               XCTAssertEqual(request.httpMethod, "GET")
               XCTAssertNil(request.httpBody)
    }
    
    

}
