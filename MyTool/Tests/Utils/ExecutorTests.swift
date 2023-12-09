//
//  Executor.swift
//
//
//  Created by ChristianBieniak on 7/12/2023.
//

import AdventOfCode
import XCTest

struct MockRunner: Runner {
 
  static func process(line: String) async throws -> String {
    return line
  }
  
  static func reduce(units: [String]) -> String {
    units.joined()
  }
}

final class ExecutorTests: XCTestCase {
  
  func testExecutor() async throws {
    let executor = RunnerExecutor(runner: MockRunner())
    let result = try await executor.execute(Bundle.module.url(forResource: "ExecutorTestData", withExtension: "txt")!)
    XCTAssertEqual("TestRestBest", result)
  }
}
