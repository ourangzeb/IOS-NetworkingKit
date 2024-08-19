//
//  ServiceManager.swift
//  MVVMSample
//
//  Created by Khan on 03/03/2023.
//

import Foundation

import UIKit

@available(iOS 13.0.0, *)
class ServiceManager {
    private let networkService: NetworkServiceTypes
    
    private let imageService: ImageServiceType
   
    @available(iOS 15.0, *)
    init(networkService: NetworkServiceTypes =  NetworkService(), imageService: ImageServiceType = ImageManger() ) {
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
