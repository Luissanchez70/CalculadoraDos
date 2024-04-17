//
//  SubtractionCaseTests.swift
//  CalculadoraDosTests
//
//  Created by Luis Fernando Sanchez Muñoz on 17/4/24.
//

import XCTest
@testable import CalculadoraDos

final class SubtractionCaseTests: XCTestCase {
    private var sut: SubtractionCase?
    override func setUpWithError() throws {
        sut = SubtractionCase()
    }
    override func tearDownWithError() throws {
        sut = nil
    }
    func test_execute1() {
        let expectedResult: Double = 24.76342
        let result = sut?.execute(num1: 25, num2: 0.23658)
        XCTAssertTrue(result == expectedResult)
    }
    func test_execute2() {
        let expectedResult: Double = -95.243599999999986
        let result = sut?.execute(num1: 53, num2: 148.2436)
        XCTAssertTrue(result == expectedResult)
    }
    func test_execute3() {
        let expectedResult: Double = 0.4741
        let result = sut?.execute(num1: 0.8598, num2: 0.3857)
        XCTAssertTrue(result == expectedResult)
    }
    func test_execute4() {
        let expectedResult: Double = -1
        let result = sut?.execute(num1: 2, num2: 3)
        XCTAssertTrue(result == expectedResult)
    }
}
