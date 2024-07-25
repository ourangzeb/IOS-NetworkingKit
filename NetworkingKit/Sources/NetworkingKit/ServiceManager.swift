//
//  ServiceManager.swift

//  Created by Khan on 03/03/2023.
//

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

