// The Swift Programming Language
// https://docs.swift.org/swift-book
//
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import ArgumentParser
import Foundation

struct Day1: AsyncParsableCommand {
  mutating func run() async throws {
    let day1Runner = RunnerExecutor(runner: Day1Runner())
    if let path = Bundle.module.url(forResource: "Day1", withExtension: "txt") {
      let result = try await day1Runner.execute(path)
      print("Answer: \(result)")
    }
  }
}
