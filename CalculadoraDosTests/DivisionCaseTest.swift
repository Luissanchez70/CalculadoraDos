//
//  DivisionCaseTest.swift
//  CalculadoraDosTests
//
//  Created by Luis Fernando Sanchez Muñoz on 17/4/24.
//

import XCTest
@testable import CalculadoraDos

final class DivisionCaseTest: XCTestCase {
    private var sut: DivisionCase?

    override func setUpWithError() throws {
      sut = DivisionCase()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_execute_whenDividedByZero() throws {
        do {
            _ = try sut?.execute(num1: 23, num2: 0)
        } catch {
            XCTAssertTrue(true)
        }
    }
    func test_execute1() throws {
        do {
            let expectedResult = 5.75
            let result = try sut?.execute(num1: 23, num2: 4)
            XCTAssertTrue(result == expectedResult)
        } catch {
            XCTAssertTrue(false)
        }
    }
    func test_execute2() throws {
        do {
            let expectedResult = 1.3658536585365855
            let result = try sut?.execute(num1: 56, num2: 41)
            XCTAssertTrue(result == expectedResult)
        } catch {
            XCTAssertTrue(false)
        }
    }
}
