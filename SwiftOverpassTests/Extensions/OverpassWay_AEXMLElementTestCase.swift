//
//  OverpassWay_AEXMLElementTestCase.swift
//  SwiftOverpassTests
//
//  Created by Wolfgang Timme on 5/17/18.
//  Copyright © 2018 Sho Kamei. All rights reserved.
//

import XCTest

import AEXML
import Alamofire
@testable import SwiftOverpass

class OverpassWay_AEXMLElementTestCase: XCTestCase {
    
    func testInitWithXMLElementShouldParseSingleNodeXMLFile() {
        guard let xmlElement = xmlRootElementInFile("SingleWay") else {
            XCTFail("Unable to load the test XML element from file.")
            return
        }
        
        let response = OverpassResponse(response: DataResponse<String>(request: nil, response: nil, data: Data(), result: Result<String>.success("")),
                                        requestQuery: "")
        
        guard let way = OverpassWay(xmlElement: xmlElement, response: response) else {
            XCTFail("The XML should properly initialize the model.")
            return
        }
        
        XCTAssertEqual(way.id, "587898625")
        XCTAssertEqual(way.tags["highway"], "secondary")
        
        let expectedNodeIds = ["292831593", "292831592"]
        XCTAssertEqual(way.nodeIds, expectedNodeIds)
    }
    
}