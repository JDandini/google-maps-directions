//
//  Network.swift
//  GoogleDirections
//
//  Created by F J Castaneda Ramos on 4/18/18.
//  Copyright © 2018 F J Castaneda Ramos. All rights reserved.
//

import Foundation
import Unbox

struct JSONObject: Decodable {
    var dictionary: [String: Any]

    init(unboxer: Unboxer) throws {
        dictionary = unboxer.dictionary
    }
}

final class Network {
    static func requestJSON(_ networkRequest: NetworkRequest, completion: ((Any?, Error?) -> Void)?) {
        do {
            let request = try networkRequest.buildRequest()
            let task =  URLSession.shared.dataTask(with: request, completionHandler: { (data, _, error) in
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                        completion?(json, nil)
                    } catch let e {
                        completion?(nil, e)
                    }
                } else {
                    completion?(nil, error)
                }

            })
            task.resume()
        } catch let e {
            completion?(nil, e)
        }
    }
}
