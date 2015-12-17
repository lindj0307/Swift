//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by 林东杰 on 12/14/15.
//
//
import UIKit
import XCTest

@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
    // MARK: FoodTracker Tests
    func testMealInitialization() {
        let potentialItem = Meal(name: "Newest meal", photo: nil , rating: 5)
        XCTAssertNotNil(potentialItem)
        
        let noName = Meal(name: "", photo: nil , rating: 0)
        XCTAssertNil(noName, "Empty name is invalid")
        
        let badRating = Meal(name: "Really bad rating", photo: nil , rating: -1)
        XCTAssertNil(badRating,"negative ratings ar invalid, be postive")
    }
}
