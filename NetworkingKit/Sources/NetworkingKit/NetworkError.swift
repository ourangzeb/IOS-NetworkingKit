//
//  NetworkError.swift

//  Created by Khan on 03/03/2023.
//
import Foundation

enum NetworkError: Error {
    case invalidRequest
    case invalidData
    case invalidResponse
    case urlError(Error)
    case invalidURLComponents
    case requestTimeout
    case unauthorized
    case notFound
    
    var localizedDescription: String {
        switch self {
        case .invalidRequest:
            return NSLocalizedString("The request was malformed or missing parameters.", comment: "")
        case .invalidData:
            return NSLocalizedString("The data received from the server was invalid or corrupted.", comment: "")
        case .invalidResponse:
            return NSLocalizedString("The response from the server was invalid or unexpected.", comment: "")
        case .urlError(let error):
            return NSLocalizedString("URL error occurred: \(error.localizedDescription)", comment: "")
        case .invalidURLComponents:
            return NSLocalizedString("URL components were invalid.", comment: "")
        case .requestTimeout:
            return NSLocalizedString("The request timed out. Please try again.", comment: "")
        case .unauthorized:
            return NSLocalizedString("Unauthorized access. Please check your credentials.", comment: "")
        case .notFound:
            return NSLocalizedString("The requested resource was not found.", comment: "")
        }
    }
}
