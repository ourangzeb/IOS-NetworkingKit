//
//  ServiceManager.swift
//  MVVMSample
//
//  Created by Khan on 03/03/2023.
//

import Foundation

import Foundation
import Combine
import UIKit

class ServiceManager {
    private let networkService: NetworkServiceTypes
    
    private let imageService: ImagedownloadServiceType
   
    init(networkService: NetworkServiceTypes =  NetworkService(), imageService: ImagedownloadServiceType = ImagedownloadService() ) {
        self.networkService = networkService
        self.imageService = imageService
    }
    
    func fetchData<T: Decodable>(with resource: Resource<T>) async throws -> T {
        return try await networkService.load(resource)
    }
    
    func fetchImage(url : URL) async throws -> UIImage {
        
   return try await self.imageService.downloadImage(from: url)
    }
}
