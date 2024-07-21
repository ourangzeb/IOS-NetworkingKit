//
//  ImageDownloadService.swift

//  Created by Khan on 06/03/2023.
//

import Foundation
import UIKit

enum ImageSize {
    case small
    case original
    var url: URL {
        switch self {
        case .small: return ApiConstants.smallImageUrl
        case .original: return ApiConstants.originalImageUrl
        }
    }
}

protocol ImageDownloadServiceType: AnyObject {
    @available(iOS 13.0, *)
    func downloadImage(from url: URL) async throws -> UIImage
}

@available(iOS 15.0, *)
class ImageDownloadService: ImageDownloadServiceType {
    func downloadImage(from url: URL) async throws -> UIImage {
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidResponse
        }
        guard let image = UIImage(data: data) else {
            throw NetworkError.invalidData
        }
        return image
    }
}
