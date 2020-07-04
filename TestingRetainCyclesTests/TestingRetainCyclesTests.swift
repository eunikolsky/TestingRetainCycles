//
//  TestingRetainCyclesTests.swift
//  TestingRetainCyclesTests
//
//  Created by u on 06.06.20.
//  Copyright © 2020 yes. All rights reserved.
//

import ReactiveCocoa
import ReactiveSwift
import TestingRetainCycles
import XCTest

class TestingRetainCyclesTests: XCTestCase {
    private static let deallocateTimeout = 1.0

    private var sut: MainViewController!

    override func setUp() {
        super.setUp()
        sut = MainViewController(nibName: nil, bundle: nil)
    }

    override func tearDown() {
        weak var _sut = sut; sut = nil
        super.tearDown()

        assertObjectIsDeallocated(_sut, objectName: "MainViewController")
    }

    func assertObjectIsDeallocated(_ object: AnyObject?, objectName: String) {
        object.map(Lifetime.of).map { (lifetime: Lifetime) in
            if !lifetime.hasEnded {
                let lifetimeEndedExpectation = expectation(description: "\(objectName) is deallocated")
                lifetime.observeEnded {
                    lifetimeEndedExpectation.fulfill()
                }

                waitForExpectations(timeout: TestingRetainCyclesTests.deallocateTimeout)
            }
        }
    }

    func testViewControllerShouldBeDeallocated() {
        sut.startDownloading()
    }
}
