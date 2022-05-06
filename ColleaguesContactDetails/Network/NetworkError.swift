//
//  NetworkError.swift
//  ColleaguesContactDetails
//
//  Created by Sukanya Yanamala on 06/05/2022.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case decodeError(Error)
    case other(Error)
}
