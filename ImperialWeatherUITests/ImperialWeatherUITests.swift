//
//  ImperialWeatherUITests.swift
//  ImperialWeatherUITests
//
//  Created by Phillip Baker on 3/18/24.
//

import CoreLocation
import Foundation
import XCTest

final class ImperialWeatherUITests: XCTestCase {
    
    var app: XCUIApplication!
    var device: XCUIDevice!
    var locationAlertMonitor: (any NSObjectProtocol)!

    @MainActor override func setUpWithError() throws {
        // Device
        device = XCUIDevice.shared
        device.orientation = .portrait
        device.appearance = .light
        
        // Provide default location
        device.location = XCUILocation(
            location: CLLocation(
                latitude: 37.334886,
                longitude: -122.008988
            )
        )
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // App
        app = XCUIApplication()
        app.launch()
        
        // Setup fastlane snapshot
        setupSnapshot(app)
        
        // Reset location permission
        app.resetAuthorizationStatus(for: .location)
        
        // Add location alert monitor
        locationAlertMonitor = addUIInterruptionMonitor(withDescription: "Location Permission Alert") { alert in
            if alert.label.contains("to use your location?") {
                alert.buttons["Allow Once"].tap()
                return true
            }
            return false
        }
        // Alert monitor handler requires interaction to run
        app.tap()
    }

    override func tearDownWithError() throws {
        removeUIInterruptionMonitor(locationAlertMonitor)
        device = nil
        app.terminate()
        app = nil
    }
    
    @MainActor func test_locationDialog() async {
        XCTAssertTrue(device.orientation.isPortrait)
        XCTAssertEqual(device.appearance, .light)
        
        snapshot("0. Location Dialog")
    }

    @MainActor func test_weatherHome_inLightMode() async {
        XCTAssertTrue(device.orientation.isPortrait)
        XCTAssertEqual(device.appearance, .light)
        
        try? await Task.sleep(for: .seconds(2))
        snapshot("1. Weather Home - Portrait (Light Mode)")
        
        device.orientation = .landscapeLeft
        XCTAssertTrue(device.orientation.isLandscape)
        snapshot("2. Weather Home - Landscape (Light Mode) ")
    }
    
    @MainActor func test_weatherHome_inDarkMode() async {
        XCTAssertTrue(device.orientation.isPortrait)
        
        device.appearance = .dark
        XCTAssertEqual(device.appearance, .dark)
        
        try? await Task.sleep(for: .seconds(2))
        snapshot("3. Weather Home - Portrait (Dark Mode)")
        
        device.orientation = .landscapeLeft
        XCTAssertTrue(device.orientation.isLandscape)
        snapshot("4. Weather Home - Landscape (Dark Mode) ")
    }
    
    @MainActor func test_weatherDetail_inLightMode() {
        XCTAssertTrue(device.orientation.isPortrait)
        XCTAssertEqual(device.appearance, .light)
    
//        let now = Date.now
//        let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: now)!
//        let day = Calendar.current.component(.day, from: tomorrow).formatted(.)
//        
//        let dayString = day.formatted(.dateTime.weekday(.wide))
//        let tomorrow = app.buttons["Wednesday"]
//        XCTAssertTrue(tomorrow.exists)
//        tomorrow.tap()
//        snapshot("5. Weather Detail - Portrait (Light Mode)")
//        
//        device.orientation = .landscapeLeft
//        snapshot("6. Weather Detail - Landscape (Dark Mode)")
    }
    
    @MainActor func test_weatherDetail_inDarkMode() {
        XCTAssertTrue(device.orientation.isPortrait)
        XCTAssertEqual(device.appearance, .light)
        
//        let monday = app.buttons["Monday"]
//        let tomorrow = app.buttons["Wednesday"]
//        XCTAssertTrue(tomorrow.exists)
//        tomorrow.tap()
//        
//        device.appearance = .dark
//        XCTAssertEqual(device.appearance, .dark)
//        
//        snapshot("7. Weather Detail - Portrait (Dark Mode)")
//        
//        device.orientation = .landscapeLeft
//        snapshot("8. Weather Detail - Landscape (Dark Mode)")
    }

//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
