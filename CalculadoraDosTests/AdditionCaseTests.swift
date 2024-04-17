//
//  AdditionCaseTests.swift
//  CalculadoraDosTests
//
//  Created by Luis Fernando Sanchez Muñoz on 17/4/24.
//

import XCTest
@testable import CalculadoraDos

final class AdditionCaseTests: XCTestCase {
    private var sut: AdditionCase?
    override func setUpWithError() throws {
        sut = AdditionCase()
    }
    override func tearDownWithError() throws {
        sut = nil
    }
    func test_execute1() {
        let expectedResult: Double = 8.4431
        let result = sut?.execute(num1: 2.111, num2: 6.3321)
        XCTAssertTrue(result == expectedResult)
    }
    func test_execute2() {
        let expectedResult: Double = 21
        let result = sut?.execute(num1: 18, num2: 3)
        XCTAssertTrue(result == expectedResult)
    }
    func test_execute3() {
        let expectedResult: Double = 144.2237892
        let result = sut?.execute(num1: 52.9966552, num2: 91.227134)
        XCTAssertTrue(result == expectedResult)
    }
}
