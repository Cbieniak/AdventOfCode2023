//
//  Day2Runner.swift
//
//
//  Created by ChristianBieniak on 9/12/2023.
//

import Foundation

public struct Day2P1Runner: Runner {
  
  enum Error: LocalizedError {
    case invalidInput
  }
  
  // Returns the ID of any game thats possible
  public static func process(line: String) async throws -> Int? {
    guard let game = decodeGame(line: line) else {
      throw Error.invalidInput
    }
    
    if game.rounds.allSatisfy({ round in
      return round.blue <= 14 &&
      round.green <= 13 &&
      round.red <= 12
    }) {
      return game.id
    }
    
    return 0
  }
  
  public static func reduce(units: [Int?]) -> Int {
    units.compactMap { $0 }.reduce(0, +)
  }
  
  private static func decodeGame(line: String) -> Game? {
   Game(string: line)
  }
}
