//
//  MultiplicationCaseTests.swift
//  CalculadoraDosTests
//
//  Created by Luis Fernando Sanchez Muñoz on 17/4/24.
//

import XCTest
@testable import CalculadoraDos

final class MultiplicationCaseTests: XCTestCase {
    private var sut: MultiplicationCase?

    override func setUpWithError() throws {
        sut = MultiplicationCase()
    }
    override func tearDownWithError() throws {
        sut = nil
    }

    func test_execute_whenMultipliedByZero() {
        let expectedResult: Double = 0
        let result = sut?.execute(num1: 45, num2: 0)
        XCTAssertTrue(result == expectedResult)
    }
    func test_execute1() {
        let expectedResult: Double = 18975
        let result = sut?.execute(num1: 575, num2: 33)
        XCTAssertTrue(result == expectedResult)
    }
    func test_execute2() {
        let expectedResult: Double = 25.662
        let result = sut?.execute(num1: 21, num2: 1.222)
        XCTAssertTrue(result == expectedResult)
    }
}
