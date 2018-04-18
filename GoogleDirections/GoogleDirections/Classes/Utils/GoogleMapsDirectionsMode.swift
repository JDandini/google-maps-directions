//
//  GoogleMapsDirectionsMode.swift
//  GoogleDirections
//
//  Created by F J Castaneda Ramos on 4/18/18.
//  Copyright © 2018 F J Castaneda Ramos. All rights reserved.
//

import Foundation

enum GoogleMapsDirectionsMode {
    case bicycle
    case walking
    case car
    case transport

    var string: String {
        switch self {
        case .bicycle:
            return "bicycling"
        case .car:
            return "driving"
        case .walking:
            return "walking"
        case .transport:
            return "transit"
        }
    }
}
