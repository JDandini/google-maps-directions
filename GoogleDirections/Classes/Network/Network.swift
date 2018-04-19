//
//  Network.swift
//  GoogleDirections
//
//  Created by F J Castaneda Ramos on 4/18/18.
//  Copyright © 2018 F J Castaneda Ramos. All rights reserved.
//

import Foundation
import Unbox
import Alamofire

struct JSONObject: Decodable {
    var dictionary: [String: Any]

    init(unboxer: Unboxer) throws {
        dictionary = unboxer.dictionary
    }
}

final class Network {
    static func requestJSON(_ networkRequest: NetworkRequest, completion: ((Any?, Error?) -> Void)?) {
        guard let request = try? networkRequest.buildRequest() else {
            let noRequestError = NSError(domain: "REQUEST_ERROR",
                                         code: 403,
                                         userInfo: [NSLocalizedDescriptionKey: "Bad Request"]) as Error
            completion?(nil, noRequestError)
            return
        }
        Alamofire.request(request).responseJSON { (response) in
            switch response.result {
            case .success(let json):
                completion?(json, nil)
            case .failure(let error):
                completion?(nil, error)
            }
        }
    }
}
