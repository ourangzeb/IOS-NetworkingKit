//
//  NetworkError.swift
//  MVVMSample
//
//  Created by Khan on 03/03/2023.
//

import Foundation
enum NetworkError: Error {
    case invalidRequest
    case invalidData
    case invalidResponse
    case urlError(Error)
    
    
    var localizedDescription: String {
        switch self {
        case .invalidRequest:
            return NSLocalizedString("The request is invalid.", comment: "")
        case .invalidData:
            return NSLocalizedString("The data is invalid.", comment: "")
        case .invalidResponse:
            return NSLocalizedString("The response is invalid.", comment: "")
        case .urlError(let error):
            return error.localizedDescription
        }
    }
}
