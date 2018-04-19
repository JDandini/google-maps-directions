//
//  GMDirection.swift
//  GoogleDirections
//
//  Created by F J Castaneda Ramos on 4/19/18.
//  Copyright © 2018 F J Castaneda Ramos. All rights reserved.
//

import Foundation
import Unbox
import CoreLocation

final class GMDirection: Decodable {

    let routes: [GMRoute]?
    let status: String?
    let geodecodedWaypoints: [GMGeocodedWayPoint]?

    init(unboxer: Unboxer) throws {
        geodecodedWaypoints = unboxer.unbox(key: "geocoded_waypoints")
        routes = unboxer.unbox(key: "routes")
        status = unboxer.unbox(key: "status")
    }
}
