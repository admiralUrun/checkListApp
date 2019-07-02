//
//  ToDosTests.swift
//  ToDosTests
//
//  Created by Andrew Yakovenko on 6/12/19.
//  Copyright © 2019 Andrii Yakovenko. All rights reserved.
//

import XCTest
@testable import ToDos

class ToDosTests: XCTestCase {
    
    var area: Area!
    var fistName: String!
    
    override func setUp() {
        fistName = "test"
        area = Area(name: fistName)
    }
    
    func testAreaName() {
        var nameNow = area.getAreaName()
        XCTAssert(nameNow == fistName, "returned \(nameNow), should be \(fistName!)")
        
        area.editArea(name: "A")
        nameNow = area.getAreaName()
        XCTAssert(nameNow == fistName, "returned \(nameNow), should be A ")
        
    }

}
