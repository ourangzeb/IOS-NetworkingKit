//
//  NetworkRequests.swift
//  MVVMSample
//
//  Created by Khan on 03/03/2023.
//

import Foundation

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
}
struct Resource<T:Decodable> {
    
    let url: URL
    let parameters: [String: CustomStringConvertible]
    let httpMethod: HttpMethod
    
    init(url: URL, parameters: [String: CustomStringConvertible] = [:]) {
            self.url = url
            self.parameters = parameters
        self.httpMethod = HttpMethod.get
        }

    init(url: URL, parameters: [String: CustomStringConvertible] = [:], httpMethod: HttpMethod = .get ) {
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

extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "&=?")
        return allowed
    }()
}
