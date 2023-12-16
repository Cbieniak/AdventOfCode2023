//
//  AdventOfCode.swift
//
//
//  Created by ChristianBieniak on 9/12/2023.
//

import ArgumentParser
import Foundation

@main
struct AdventOfCode: AsyncParsableCommand {
  static var configuration = CommandConfiguration(
    subcommands: [Day1.self, Day2.self])
  
  @Argument
  var day: Int = 2
  
  mutating func run() async throws {
    switch day {
      case 1:
        var day1 = Day1()
        try await day1.run()
      case 2:
        var day2 = Day2()
        try await day2.run()
      default:
        break
    }
  }
}
