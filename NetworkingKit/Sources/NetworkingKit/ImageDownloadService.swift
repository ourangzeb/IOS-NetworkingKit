//
//  ImageDownloadService.swift
//  MVVMSample
//
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
protocol ImagedownloadServiceType: AnyObject {
    func downloadImage(from url: URL) async throws -> UIImage
}


class ImagedownloadService: ImagedownloadServiceType {
    func downloadImage(from url: URL) async throws -> UIImage {
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NSError(domain: "HTTPError", code: (response as? HTTPURLResponse)?.statusCode ?? 500, userInfo: nil)
        }
        guard let image = UIImage(data: data) else {
            throw NSError(domain: "InvalidImageDataError", code: 0, userInfo: nil)
        }
        return image
    }
}
