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
        case .small: return URL(string: ApiConstants.smallImageUrl)!
        case .original: return URL(string: ApiConstants.originalImageUrl)!
        }
    }
}
protocol ImageServiceType: AnyObject {
    @available(iOS 13.0.0, *)
    func downloadImage(from url: URL) async throws -> UIImage
}


@available(iOS 15.0, *)
class ImageManger: ImageServiceType {
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
