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
          subcommands: [Day1.self])
  
  @Argument
  var day: Int = 1
  
  mutating func run() async throws {
    switch day {
      case 1:
        var day1 = Day1()
        try await day1.run()
      default:
        break
    }
  }
}
