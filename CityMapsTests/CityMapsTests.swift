//
//  CityMapsTests.swift
//  CityMapsTests
//
//  Created by Martin Valorzi on 16/09/2024.
//

import XCTest
@testable import CityMaps

final class CityMapsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMapViewCoordinate() {
        let viewModel = MapViewModel(city: City(id: 1, coordinate: CityCoordinate(latitude: 51.507222, longitude: -0.1275)))
        let mapView = MapView(viewModel: viewModel)
        XCTAssertTrue(viewModel.city?.coordinate.latitude ?? 0 != 0)
      }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
