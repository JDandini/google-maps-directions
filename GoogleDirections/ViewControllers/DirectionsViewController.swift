//
//  DirectionsViewController.swift
//  GoogleDirections
//
//  Created by F J Castaneda Ramos on 4/18/18.
//  Copyright © 2018 F J Castaneda Ramos. All rights reserved.
//

import UIKit
import CoreLocation

class DirectionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let apiKey = "AIzaSyAH08YnvLSewLic_JBF6o5KzwKOppAijUY"
        let chapultepecCastle = CLLocationCoordinate2D(latitude: 19.422503,
                                                       longitude: -99.182065)
        let garibaldiPlaza = CLLocationCoordinate2D(latitude: 19.441267,
                                                       longitude: -99.139456)
        let reforma77 = CLLocationCoordinate2D(latitude: 19.433375,
                                               longitude: -99.154434)
        let independenceAngel = CLLocationCoordinate2D(latitude: 19.427021,
                                                       longitude: -99.167695)

        let request = GoogleDirectionsRequest.directionsWithCoordinates(origin: chapultepecCastle, destination: garibaldiPlaza, mode: .bicycle, wayPoints: [reforma77, independenceAngel], apiKey: apiKey)

        Network.requestJSON(request) { (result, error) in

            if let e = error {
                print(e.localizedDescription)
            }
            if let jsonDic = result as? JSON, let direction = GMDirection(json: jsonDic) {
                print("status: \(direction.status ?? "")")
                print("\n\npolyline: \(direction.routes?.first?.overviewPolyline ?? "")")
            }

        }
    }
}
