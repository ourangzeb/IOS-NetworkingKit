//
//  File.swift
//  
//
//  Created by Khan on 19/08/2024.
//

import XCTest
@testable import NetworkingKit
class ApiConstantsTests: XCTestCase {
        
    
    func testApiKey() {
           // Test that the apiKey is correctly set
           XCTAssertEqual(ApiConstants.apiKey, "181af7fcab50e40fabe2d10cc8b90e37", "API key does not match expected value.")
       }
       
       func testBaseUrl() {
           // Test that the baseUrl is correctly set and is a valid URL
           XCTAssertEqual(ApiConstants.baseUrl.absoluteString, "https://api.themoviedb.org/3", "Base URL does not match expected value.")
       }

       func testOriginalImageUrl() {
           // Test that the originalImageUrl is correctly set and is a valid URL
           XCTAssertEqual(ApiConstants.originalImageUrl.absoluteString, "https://image.tmdb.org/t/p/original", "Original image URL does not match expected value.")
       }
       
       func testSmallImageUrl() {
           // Test that the smallImageUrl is correctly set and is a valid URL
           XCTAssertEqual(ApiConstants.smallImageUrl.absoluteString, "https://image.tmdb.org/t/p/w154", "Small image URL does not match expected value.")
       }

       func testValidBaseUrl() {
           // Test that the baseUrl is a valid URL
           XCTAssertNotNil(URL(string: ApiConstants.baseUrl.absoluteString), "Base URL is not valid.")
       }

       func testValidOriginalImageUrl() {
           // Test that the originalImageUrl is a valid URL
           XCTAssertNotNil(URL(string: ApiConstants.originalImageUrl.absoluteString), "Original image URL is not valid.")
       }

       func testValidSmallImageUrl() {
           // Test that the smallImageUrl is a valid URL
           XCTAssertNotNil(URL(string: ApiConstants.smallImageUrl.absoluteString), "Small image URL is not valid.")
       }
    
    
    
    
    
}
