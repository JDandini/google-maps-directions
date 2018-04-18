//
//  NetworkRequest.swift
//  GoogleDirections
//
//  Created by F J Castaneda Ramos on 4/18/18.
//  Copyright © 2018 F J Castaneda Ramos. All rights reserved.
//

import UIKit
import Alamofire

typealias JSON = [String: Any]

protocol NetworkRequest {

    var urlBase: URL? { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: JSON? { get }
    var headers: [String: String]? { get }

}

// MARK: - Network Request extension to build the request
extension NetworkRequest {
    func buildRequest() throws -> URLRequest {
        guard let base = urlBase?.absoluteString, let url = URL(string: base + path) else {
            throw NetworkRequestError.invalidURL
        }
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        request.httpMethod = method.rawValue
        request.timeoutInterval = 10
        if let parameters = self.parameters {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        }
        return request
    }
}

enum NetworkRequestError: Error {
    case invalidURL
}
