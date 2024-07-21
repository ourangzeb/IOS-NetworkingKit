//
//  ServiceManager.swift
//  MVVMSample
//
//  Created by Khan on 03/03/2023.
//

import Foundation

import UIKit
import Foundation
import UIKit

@available(iOS 13.0, *)
class ServiceManager {
    private let networkService: NetworkServiceTypes
    private let imageService: ImageDownloadServiceType

    @available(iOS 15.0, *)
    init(networkService: NetworkServiceTypes = NetworkService(), imageService: ImageDownloadServiceType = ImageDownloadService()) {
        self.networkService = networkService
        self.imageService = imageService
    }
    
    func fetchData<T: Decodable>(with resource: Resource<T>) async throws -> T {
        return try await networkService.load(resource)
    }
    
    func fetchImage(from url: URL) async throws -> UIImage {
        return try await imageService.downloadImage(from: url)
    }
}
@available(iOS 13.0, *)
protocol ImageDownloadServiceType: AnyObject {
    func downloadImage(from url: URL) async throws -> UIImage
}

@available(iOS 15.0, *)
class ImageDownloadService: ImageDownloadServiceType {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func downloadImage(from url: URL) async throws -> UIImage {
        let (data, response) = try await session.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
            throw NetworkError.invalidResponse
        }
        guard let image = UIImage(data: data) else {
            throw NetworkError.invalidData
        }
        return image
    }
}
