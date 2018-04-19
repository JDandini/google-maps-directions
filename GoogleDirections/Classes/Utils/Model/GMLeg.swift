//
//  GMLeg.swift
//  GoogleDirections
//
//  Created by F J Castaneda Ramos on 4/19/18.
//  Copyright © 2018 F J Castaneda Ramos. All rights reserved.
//

import Foundation
import Unbox
import CoreLocation

final class GMLeg: Decodable {

    let distance: (text: String, value: Int)?
    let duration: (text: String, value: Int)?
    let startLocation: CLLocationCoordinate2D?
    let startAddress: String?
    let endLocation: CLLocationCoordinate2D?
    let endAddress: String?
    let steps: [GMStep]?

    init(unboxer: Unboxer) throws {
        if let text: String = unboxer.unbox(keyPath: "distance.text"),
            let value: Int = unboxer.unbox(keyPath: "distance.value") {
            distance = (text, value)
        } else {
            distance = nil
        }

        if let text: String = unboxer.unbox(keyPath: "duration.text"),
            let value: Int = unboxer.unbox(keyPath: "duration.value") {
            duration = (text, value)
        } else {
            duration = nil
        }

        if let lat: Double = unboxer.unbox(keyPath: "start_location.lat"),
            let lon: Double = unboxer.unbox(keyPath: "start_location.lng") {
            startLocation = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        } else {
            startLocation = nil
        }

        if let lat: Double = unboxer.unbox(keyPath: "end_location.lat"),
            let lon: Double = unboxer.unbox(keyPath: "end_location.lng") {
            endLocation = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        } else {
            endLocation = nil
        }

        startAddress = unboxer.unbox(key: "start_address")
        endAddress = unboxer.unbox(key: "end_address")
        steps = unboxer.unbox(key: "steps")
    }
}
