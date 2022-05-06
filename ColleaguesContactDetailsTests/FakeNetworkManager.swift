//
//  FakeNetworkManager.swift
//  ColleaguesContactDetailsTests
//
//  Created by Sukanya Yanamala on 06/05/2022.
//

import Foundation
import Combine
@testable import ColleaguesContactDetails



class FakeNetworkManager: NetworkManager {
    
    var data: Data?
    var error: NetworkError?
    
    
    func getModel<Model>(_ model: Model.Type, from url: String) -> AnyPublisher<Model, NetworkError> where Model : Decodable {
        
        if let data = data {
            do {
                let result = try JSONDecoder().decode(model, from: data)
                return CurrentValueSubject<Model, NetworkError>(result).eraseToAnyPublisher()
            } catch { }
        }
        
        if let error = error {
            return Fail<Model, NetworkError>(error: error).eraseToAnyPublisher()
        }
        
        return Fail<Model, NetworkError>(error: .badURL).eraseToAnyPublisher()
    }

    
    func getData(from url: String, completionHandler: @escaping (Data?) -> Void) {
        if let data = data {
            completionHandler(data)
        }
        
       
    }
}

