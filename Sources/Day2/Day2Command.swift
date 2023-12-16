// The Swift Programming Language
// https://docs.swift.org/swift-book
//
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import ArgumentParser
import Foundation

struct Day2: AsyncParsableCommand {
  mutating func run() async throws {
    let day2Runner = RunnerExecutor(runner: Day2P2Runner())
    if let path = Bundle.module.url(forResource: "Day2", withExtension: "txt") {
      let result = try await day2Runner.execute(path)
      print("Answer: \(result)")
    }
  }
}
