// The Swift Programming Language
// https://docs.swift.org/swift-book
//
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import ArgumentParser
import Foundation

struct Day3: AsyncParsableCommand {
  mutating func run() async throws {
    let day3Runner = RunnerExecutor(runner: Day3Runner())
    if let path = Bundle.module.url(forResource: "Day3", withExtension: "txt") {
      let result = try await day3Runner.execute(path)
      print("Answer: \(result)")
    }
  }
}
