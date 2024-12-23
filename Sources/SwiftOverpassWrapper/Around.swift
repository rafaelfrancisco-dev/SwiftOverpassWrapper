//
//  Around.swift
//  SwiftOverpass
//
//  Created by Adam Bezák on 23/01/2019.
//  Copyright © 2019 Sho Kamei. All rights reserved.
//

import Foundation

public struct Around {
    let lat: Double
    let lon: Double
    let radius: Double

    public init(lat: Double, lon: Double, radius: Double) {
        self.lat = lat
        self.lon = lon
        self.radius = radius
    }
}
