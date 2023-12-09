//
//  Day1Tests.swift
//
//
//  Created by ChristianBieniak on 7/12/2023.
//

import AdventOfCode
import XCTest

final class Day1Tests: XCTestCase {
  
  func testProcessing() async throws {
    let processedValue = try await Day1Runner.process(line: "two1nine")
    XCTAssertEqual(processedValue, 29)
  }
  
  func testReduction() {
    let values = [ 29, 83, 13, 24, 42, 14, 76 ]
    
    let reducedValue = Day1Runner.reduce(units: values)
    
    XCTAssertEqual(reducedValue, 281)
  }
}
