//
//  Decodable.swift
//  GoogleDirections
//
//  Created by F J Castaneda Ramos on 4/18/18.
//  Copyright © 2018 F J Castaneda Ramos. All rights reserved.
//

import Foundation
import Unbox

protocol Decodable: Unboxable {
    init?(json: JSON)
}

extension Decodable {
    init?(json: JSON) {
        try? self.init(unboxer: Unboxer(dictionary: json))
    }
}
