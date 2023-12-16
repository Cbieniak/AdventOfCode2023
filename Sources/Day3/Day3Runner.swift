//
//  Day3Runner.swift
//
//
//  Created by ChristianBieniak on 16/12/2023.
//

import Foundation

public struct Day3Runner: Runner {
  
  enum Error: LocalizedError {
    case invalidInput
  }
  
  public static func process(line: String) async throws -> Int? {
    return 0
  }
  
  public static func reduce(units: [Int?]) -> Int {
    units.compactMap { $0 }.reduce(0, +)
  }
}
