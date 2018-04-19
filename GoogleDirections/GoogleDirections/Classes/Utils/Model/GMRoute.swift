//
//  GMRoute.swift
//  GoogleDirections
//
//  Created by F J Castaneda Ramos on 4/19/18.
//  Copyright © 2018 F J Castaneda Ramos. All rights reserved.
//

import Foundation
import CoreLocation
import Unbox

final class GMRoute: Decodable {
    let bounds: (northEast: CLLocationCoordinate2D, southWest: CLLocationCoordinate2D)?
    let copyrights: String?
    let legs: [GMLeg]?
    let overviewPolyline: String?
    let summary: String?
    let warnings: [String]?
    let waypointOrder: [Int]?

    init(unboxer: Unboxer) throws {
        if let northEastLat: Double = unboxer.unbox(keyPath: "bounds.northeast.lat"),
            let northEastLon: Double = unboxer.unbox(keyPath: "bounds.northeast.lng"),
            let southWestLat: Double = unboxer.unbox(keyPath: "bounds.southwest.lat"),
            let southWestLon: Double = unboxer.unbox(keyPath: "bounds.southwest.lng") {
                let northEast = CLLocationCoordinate2D(latitude: northEastLat, longitude: northEastLon)
                let southWest = CLLocationCoordinate2D(latitude: southWestLat, longitude: southWestLon)
            bounds = (northEast, southWest)
        } else {
            bounds = nil
        }
        copyrights = unboxer.unbox(key: "copyrights")
        overviewPolyline = unboxer.unbox(keyPath: "overview_polyline.points")
        legs = unboxer.unbox(key: "legs")
        summary = unboxer.unbox(key: "summary")
        warnings = unboxer.unbox(key: "warnings")
        waypointOrder = unboxer.unbox(key: "waypoint_order")
    }

}
