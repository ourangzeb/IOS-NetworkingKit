//
//  RequestManager.swift
//  MVVMSample
//
//  Created by Khan on 03/03/2023.
//

import Foundation

import Combine

protocol NetworkServiceTypes: AnyObject {
    
    @discardableResult
    func load<T>(_ resource: Resource<T>) async throws -> T
}
class NetworkService: NetworkServiceTypes {
    private let session: URLSession
    
    init(session: URLSession = URLSession(configuration: URLSessionConfiguration.ephemeral)) {
        self.session = session
    }
    @discardableResult
    func load<T:Decodable> (_ resource: Resource<T>) async throws -> T  {
        guard let request = resource.request else {
            throw NetworkError.invalidRequest
        }
        
        do {
            let (data, response) = try await session.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }
            guard 200..<300 ~= httpResponse.statusCode else {
                throw NetworkError.invalidData
            }
            let result = try JSONDecoder().decode(T.self, from: data)
            return result
        } catch {
            throw NetworkError.invalidResponse
        }
    }
}
