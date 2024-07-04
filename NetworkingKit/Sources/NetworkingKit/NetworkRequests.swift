//
//  NetworkRequests.swift
//  MVVMSample
//
//  Created by Khan on 03/03/2023.
//

import Foundation
import Foundation

// Define the HttpMethod enum
enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
}

// Define the Endpoint protocol
protocol Endpoint {
    var url: URL { get }
    var parameters: [String: CustomStringConvertible] { get }
    var httpMethod: HttpMethod { get }
    var request: URLRequest? { get }
}

// Adapt the Resource struct to conform to the Endpoint protocol
struct Resource<T: Decodable>: Endpoint {
    
    let url: URL
    let parameters: [String: CustomStringConvertible]
    let httpMethod: HttpMethod
    
    init(url: URL, parameters: [String: CustomStringConvertible] = [:], httpMethod: HttpMethod = .get) {
        self.url = url
        self.parameters = parameters
        self.httpMethod = httpMethod
    }
    
    var request: URLRequest? {
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            return nil
        }
        if httpMethod == HttpMethod.get {
            components.queryItems = parameters.keys.map { key in
                URLQueryItem(name: key, value: parameters[key]?.description)
            }
            guard let url = components.url else { return nil }
            return URLRequest(url: url)
        } else if httpMethod == HttpMethod.post {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = httpMethod.rawValue
            urlRequest.httpBody = parameters.percentEncoded()
            urlRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            return urlRequest
        } else {
            return nil
        }
    }
}

// Dictionary extension for percent encoding
extension Dictionary where Key == String, Value == CustomStringConvertible {
    func percentEncoded() -> Data? {
        return map { key, value in
            let escapedKey = key.addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? key
            let escapedValue = value.description.addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? value.description
            return "\(escapedKey)=\(escapedValue)"
        }
        .joined(separator: "&")
        .data(using: .utf8)
    }
}

// CharacterSet extension for URL query value allowed characters
extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "&=?")
        return allowed
    }()
}
