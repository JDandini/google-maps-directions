//
//  GoogleDirectionsRequest.swift
//  GoogleDirections
//
//  Created by F J Castaneda Ramos on 4/18/18.
//  Copyright © 2018 F J Castaneda Ramos. All rights reserved.
//

import Foundation
import CoreLocation
import Alamofire

enum GoogleDirectionsRequest: NetworkRequest {

    case directionsWithCoordinates(origin: CLLocationCoordinate2D, destination: CLLocationCoordinate2D, mode: GoogleMapsDirectionsMode?, wayPoints: [CLLocationCoordinate2D]?, apiKey: String)

    var urlBase: URL? {
        switch self {
        case .directionsWithCoordinates :
            return URL(string: "https://maps.googleapis.com/maps/api/directions/json?")
        }
    }

    var path: String {
        switch self {
        case let .directionsWithCoordinates(origin, destination, mode, wayPoints, apiKey):
            var path = ""
            path += "origin=" + "\(origin.latitude),\(origin.longitude)"
            path += "&destination=" + "\(destination.latitude),\(destination.longitude)"
            path += "&mode=" + (mode?.string ?? GoogleMapsDirectionsMode.bicycle.string)
            if let waypointStr = wayPointsStr(wayPoints) {
                path += waypointStr
            }
            path += "&key=" + apiKey
            return path
        }
    }

    var method: HTTPMethod {
        switch self {
        case .directionsWithCoordinates: return .get
        }
    }

    var parameters: JSON? {
        switch self {
        case .directionsWithCoordinates: return nil
        }
    }

    var headers: [String: String]? {
        switch self {
        case .directionsWithCoordinates: return nil
        }
    }

    private func wayPointsStr(_ waypoints: [CLLocationCoordinate2D]?) -> String? {
        guard let points = waypoints, !points.isEmpty else { return nil }
        var waypointsString = "&waypoints="
        waypointsString += points.map { "\($0.latitude),\($0.longitude)" }.reduce("", { $0 + "|" + $1 })
        waypointsString = waypointsString.replacingOccurrences(of: "=|", with: "=")
        if let escapedString = waypointsString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) {
            waypointsString = escapedString
        }
        return waypointsString
    }
}
