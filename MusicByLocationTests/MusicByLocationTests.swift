//
//  MusicByLocationTests.swift
//  MusicByLocationTests
//
//  Created by Leo Hammond on 02/03/2023.
//

import XCTest
@testable import MusicByLocation

class MusicByLocationTests: XCTestCase {

    func testStringTupleMethodsWorkAsExpected() {
        //arrange
        let stringTuple = StringTuple("one","two")
        let expectedFirst = "one"
        let expectedSecond = "two"
        //act
        let actualFirst = stringTuple.getFirst()
        let actualSecond = stringTuple.getSecond()
        //assert
        XCTAssertEqual(actualFirst,expectedFirst)
        XCTAssertEqual(actualSecond,expectedSecond)
    }
    
    func testJSONDecodes() {
        //arrange
        let iTunesAdaptor = ITunesAdaptor()
        let state = StateController()
        //act
        let actual: () = iTunesAdaptor.getArtists(search: state.lastKnownLocation, completion: state.updateArtistsViaLocation)
        //assert
        XCTAssertNotNil(actual)
    }
}


