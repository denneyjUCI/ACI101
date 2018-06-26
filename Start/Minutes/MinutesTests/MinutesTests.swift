//
//  MinutesTests.swift
//  MinutesTests
//
//  Created by Jonathan on 6/26/18.
//  Copyright © 2018 Microsoft. All rights reserved.
//

import XCTest
@testable import Minutes

class MinutesTests: XCTestCase {

    var entryUnderTest: Entry!

    override func setUp() {
        super.setUp()
        entryUnderTest = Entry("Title", "Content")
    }
    
    override func tearDown() {
        entryUnderTest = nil
        super.tearDown()
    }
    
    func testSerialization() {
        guard let serializedData = FileEntryStore.serialize(entryUnderTest) else { XCTFail(); return }
        let entry = FileEntryStore.deserialize(serializedData)

        XCTAssertEqual(entry?.title, "Title", "Title doesn't match")
        XCTAssertEqual(entry?.content, "Content", "Content doesn't match")
    }
    
}
