//
//  GMGeocodedWayPoint.swift
//  GoogleDirections
//
//  Created by F J Castaneda Ramos on 4/19/18.
//  Copyright © 2018 F J Castaneda Ramos. All rights reserved.
//

import Foundation
import Unbox

final class GMGeocodedWayPoint: Decodable {
    let geocoderStatus: String?
    let placeID: String?
    let types: [String]?

    init(unboxer: Unboxer) throws {
        geocoderStatus = unboxer.unbox(key: "geocoder_status")
        placeID = unboxer.unbox(key: "place_id")
        types = unboxer.unbox(key: "types")
    }
}
