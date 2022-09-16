//
//  Network.swift
//  Avows Recruitment
//
//  Created by Jonathan Andrei on 12/09/22.
//

import Foundation
import Alamofire

enum Result<T> {
    case success(T)
    case failure(Error)
}

class NetworkLayer {
    func request<T: Codable>(_ url: String, decodeToType type: T.Type, completionHandler: @escaping (Result<T>) -> ()) {
            
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseData { resp in
            switch resp.result {
            case .success(let data):
                do {
                    let decoded = try JSONDecoder().decode(T.self, from: data)
                    completionHandler(.success(decoded))
                } catch {
                    completionHandler(.failure(error))
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
