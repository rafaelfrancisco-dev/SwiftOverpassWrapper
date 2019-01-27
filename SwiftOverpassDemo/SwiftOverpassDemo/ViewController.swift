//
//  ViewController.swift
//  SwiftOverpassDemo
//
//  Created by Sho Kamei on 2017/12/03.
//  Copyright © 2017年 Sho Kamei. All rights reserved.
//

import UIKit
import SwiftOverpass

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let node = NodeQuery()
        node.hasTag("name", equals: "Schloss Neuschwanstein")
        let rel = node.relation()
        
        let query = WayQuery()
        let around = Around(lat: 49.202502, lon: 16.607205, radius: 50)
        query.around = around
        query.hasTag("railway", equals: "tram")

        SwiftOverpass.api(endpoint: "http://overpass-api.de/api/interpreter", recurseType: "down").fetch(query) { (response, error) in
            switch (response, error) {
            case let (.some(overpassResponse), nil):
                self.generateNamedLocations(overpassResponse: overpassResponse)
            case (nil, _):
                print("error")
                break
            default:
                print("default")
                break
            }
        }

    }

    private func generateNamedLocations(overpassResponse: OverpassResponse) {
        if let nodes = overpassResponse.nodes {
            print(nodes)
        } else if let ways = overpassResponse.ways {
            print(ways)
        } else if let relations = overpassResponse.relations {
            print(relations)
        }
    }

    override func loadView() {
        super.loadView()
    }
}

