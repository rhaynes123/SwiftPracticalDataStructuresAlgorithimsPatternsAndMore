//
//  PostServiceError.swift
//  PostApp
//
//  Created by richard Haynes on 6/29/23.
//

import Foundation
enum PostServiceError : Error {
    case failed, failedToDecode,invalidStatusCode
    
    var text: String {
        switch self {
            
        case .failed:
            return "There was an unexpected failure."
        case .failedToDecode:
            return "The values from the API could not be decoded."
        case .invalidStatusCode:
            return "The status code returned was not a success status code."
        }
    }
}
