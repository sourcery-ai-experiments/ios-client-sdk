//
//  DevCycleOptionsTest.swift
//  DevCycleTests
//

import XCTest
@testable import DevCycle

class DevCycleOptionsTest: XCTestCase {
    func testOptionsAreNil() {
        let options = DevCycleOptions()
        XCTAssertNil(options.disableEventLogging)
        XCTAssertNil(options.flushEventsIntervalMs)
    }
    
    func testBuilderReturnsOptions() {
        let options = DevCycleOptions.builder()
                .disableEventLogging(false)
                .flushEventsIntervalMs(1000)
                .enableEdgeDB(true)
                .configCacheTTL(172800000)
                .disableConfigCache(true)
                .disableRealtimeUpdates(true)
                .build()
        XCTAssertNotNil(options)
        XCTAssert(options.flushEventsIntervalMs == 1000)
        XCTAssertFalse(options.disableEventLogging!)
        XCTAssert(options.enableEdgeDB)
        XCTAssert(options.configCacheTTL == 172800000)
        XCTAssert(options.disableConfigCache)
        XCTAssert(options.disableRealtimeUpdates)
    }
    
    func testBuilderReturnsOptionsAndSomeAreNil() {
        let options = DevCycleOptions.builder()
                .disableEventLogging(false)
                .build()
        XCTAssertNotNil(options)
        XCTAssertNil(options.flushEventsIntervalMs)
        XCTAssertFalse(options.disableEventLogging!)
        XCTAssertFalse(options.enableEdgeDB)
        XCTAssertFalse(options.disableRealtimeUpdates)
    }
    
    func testDeprecatedDVCOptions() {
        let options = DVCOptions.builder()
                .disableEventLogging(false)
                .build()
        XCTAssertNotNil(options)
        XCTAssertNil(options.flushEventsIntervalMs)
        XCTAssertFalse(options.disableEventLogging!)
        XCTAssertFalse(options.enableEdgeDB)
        XCTAssertFalse(options.disableRealtimeUpdates)
    }
}