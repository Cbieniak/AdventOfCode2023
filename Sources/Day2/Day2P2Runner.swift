//
//  Day2Runner.swift
//
//
//  Created by ChristianBieniak on 9/12/2023.
//

import Foundation
import RegexBuilder

public struct Day2P2Runner: Runner {
  
  enum Error: LocalizedError {
    case invalidInput
  }
  
  // Returns the ID of any game thats possible
  public static func process(line: String) async throws -> Int? {
    guard let game = decodeGame(line: line) else {
      throw Error.invalidInput
    }
    let mins = findMinimumColorValues(game: game)
    return mins.blue * mins.green * mins.red
  }
  
  public static func findMinimumColorValues(game: Game) -> Round {
    var redLowest = 0
    var greenLowest = 0
    var blueLowest = 0
    
    for round in game.rounds {
      if redLowest < round.red {
        redLowest = round.red
      }
      if greenLowest < round.green {
        greenLowest = round.green
      }
      if blueLowest < round.blue {
        blueLowest = round.blue
      }
    }
    
    return Round(green: greenLowest, blue: blueLowest, red: redLowest)
  }
  
  public static func reduce(units: [Int?]) -> Int {
    units.compactMap { $0 }.reduce(0, +)
  }
  
  private static func decodeGame(line: String) -> Game? {
   Game(string: line)
  }
}
