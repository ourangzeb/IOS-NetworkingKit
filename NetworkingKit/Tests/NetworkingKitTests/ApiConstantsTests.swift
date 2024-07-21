//
//  ApiConstantsTests.swift
//  
//
//  Created by Khan on 21/07/2024.
//
import XCTest
import Foundation

@testable import NetworkingKit

class ApiConstantsTests: XCTestCase {

    func testApiKey() {
        // Assert that the API key is not empty
        XCTAssertFalse(ApiConstants.apiKey.isEmpty, "API key should not be empty")
    }
    
    func testBaseUrl() {
        // Assert that the base URL is correct and not nil
        XCTAssertNotNil(ApiConstants.baseUrl, "Base URL should not be nil")
        XCTAssertEqual(ApiConstants.baseUrl.absoluteString, "https://api.themoviedb.org/3", "Base URL is incorrect")
    }
    
    func testOriginalImageUrl() {
        // Assert that the original image URL is correct and not nil
        XCTAssertNotNil(ApiConstants.originalImageUrl, "Original image URL should not be nil")
        XCTAssertEqual(ApiConstants.originalImageUrl.absoluteString, "https://image.tmdb.org/t/p/original", "Original image URL is incorrect")
    }
    
    func testSmallImageUrl() {
        // Assert that the small image URL is correct and not nil
        XCTAssertNotNil(ApiConstants.smallImageUrl, "Small image URL should not be nil")
        XCTAssertEqual(ApiConstants.smallImageUrl.absoluteString, "https://image.tmdb.org/t/p/w154", "Small image URL is incorrect")
    }
}
