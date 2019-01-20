//
//  Protocol.swift
//  SwipeMatchApplication
//
//  Created by ashim dahal on 1/19/19.
//  Copyright © 2019 ashim dahal. All rights reserved.
//

import Foundation

enum ServiceError: Error {
    case invalidURL
    case authenticationFailed
    case invalidRequestData
    case noResponseData
    case noObjectsReturned
    case invalidResponseData
    case unknown
}

protocol Service {
    
}
